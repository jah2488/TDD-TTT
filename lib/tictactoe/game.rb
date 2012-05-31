module TicTacToe
  class Game

    attr_accessor :computer, :player_type, :current_player, :other_player, :board

    def initialize
      @io = InputOutput.new
      @computer_type = ""
      @current_player = "X"
      @other_player = "O"
      @board = Board.new
    end

    def input
      @io.input
    end

    def setup
      @io.output "Tic Tac Toe"
      @io.output "How many players are there? (1) or (2)"
      response = input
      until response == "1" || response == "2"
        response = input
      end
      if response == "1"
        @computer_type = get_computer_type
        @computer = ComputerPlayer.new(@computer_type)
      end
      start
    end

    def get_computer_type
      @io.output "Pick your player type. (X) or (O)"
      move = input.upcase
      until move == "X" || move  == "O"
        @io.output "Invalid player type"
        move = input.upcase
      end
      return  move == 'X' ? 'O' : 'X'
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
      @io.output "Its #{@current_player}s Turn"
    end

    def get_move
      move = ""
      until @board.open_cells.include?(move)
        @io.outprint "-> "
        move = get_input
        draw
      end
      return move
    end

    def get_input
      return @computer.make_move(@board) if @computer_type == @current_player
      input.to_sym
    end

    def draw
      system('clear')
      @io.output "Moves Available: #{ @board.spaces_available} \n"
      @io.output  @board.print
    end

    def move(space)
      @board.move(space, @current_player)
    end

    def end_turn
      draw
      check_game_state
      switch_players
      start_turn
    end

    def check_game_state
      if winner
        game_over
      elsif stalemate?
        stalemate
      end
    end

    def winner
      @board.winner
    end

    def moves_left
      @board.spaces_available
    end

    def stalemate?
      @board.stalemate?
    end

    def stalemate
      @io.output "STALEMATE!"
      play_again
    end

    def game_over
      @io.output "Player #{@board.winner} Wins!"
      @io.output "Game Over!"
      play_again
    end

    def play_again
      @io.output "Do you want to play again?"

      if input =~ /yes/
        system('clear')
        g = Game.new(@output, @input)
        g.setup
      else
        @io.output "Goodbye!"
        exit(0)
      end
    end

    def switch_players
      @current_player, @other_player = @other_player, @current_player
    end

    def help
      @io.output "Pick a number coorisponding with an open tile on the board, then hit enter!"
      @io.output "For Example, typing 'a1' will place your move in the first cell (top left)"
    end

  end
end
