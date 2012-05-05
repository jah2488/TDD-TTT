module TicTacToe
  class MultiPlayerGame < Game

    def initialize(output, input)
      super
    end

    def start
      until @board.game_over?
        start_turn
        space = get_input
        move(space)
        end_turn
      end
    end

    def start_turn
      draw
      @output.puts "Its #{@current_player}s Turn"
    end

    def get_input
      @output.print "-> "
      move = ""
      until @board.open_cells.include?(move)
        move = @input.gets.chomp
      end
    end

    def draw
      #system('clear')
      @output.puts "Moves Available: #{ @board.open_spaces}"
      @output.puts @board.print
    end

    def move(space)
      @board.move(space, @current_player)
      draw
    end

    def end_turn
      if @board.winner
        game_over
      else
        switch_players
        start_turn
      end
    end

    def game_over
      @output.puts "Player #{@board.winner} Wins!"
      @output.puts "Game Over!"
      @output.puts "Do you want to play again?"

      response = @input.gets.chomp

      if response =~ /[yes]/
        Game.new(@output, @input)
      else
        @output.puts "Goodbye!"
        #exit(0)
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
