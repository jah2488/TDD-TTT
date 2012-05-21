module TicTacToe
  class Game

    attr_accessor :player_type, :current_player, :other_player, :board

    def initialize(output = STDOUT, input = STDIN)
      @output = output
      @input  = input
      @computer_type = ""
      @current_player = "X"
      @other_player = "O"
      @board = Board.new
    end

    def input
      @input.gets.chomp
    end

    def setup
      @output.puts "Tic Tac Toe"
      @output.puts "How many players are there? (1) or (2)"
      response = input
      until response == "1" || response == "2"
        response = input
      end
      game = response == "1" ? SinglePlayerGame.new(@output, @input) : MultiPlayerGame.new(@output, @input)
      game.start
    end

    def start
      until @board.game_over?
        start_turn
        space = get_move
        move(space)
        end_turn
      end
    end



    def start_turn
      draw
      @output.puts "Its #{@current_player}s Turn"
    end

    def get_move
      move = ""
      until @board.open_cells.include?(move)
        @output.print "-> "
        move = get_input
      end
      return move
    end

    def get_input
      return @computer.make_move(@board) if @computer_type == @current_player
      input.to_sym
    end

    def draw
      system('clear')
      @output.puts "Moves Available: #{ @board.spaces_available}"
      @output.puts ""
      @output.puts @board.print
    end

    def move(space)
      @board.move(space, @current_player)
      draw
    end

    def end_turn
      if @board.winner
        game_over
      elsif @board.stalemate?
        stalemate
      else
        switch_players
        start_turn
      end
    end

    def stalemate
      @output.puts "STALEMATE!"
      play_again
    end

    def game_over
      @output.puts "Player #{@board.winner} Wins!"
      @output.puts "Game Over!"
      play_again
    end

    def play_again
      @output.puts "Do you want to play again?"

      if input =~ /yes/
        system('clear')
        g = Game.new(@output, @input)
        g.setup
      else
        @output.puts "Goodbye!"
        exit(0)
      end
    end

    def switch_players
      @current_player, @other_player = @other_player, @current_player
    end

    def help
      @output.puts "Pick a number coorisponding with an open tile on the board, then hit enter!"
      @output.puts "For Example, typing 'a1' will place your move in the first cell (top left)"
    end


  end
end
