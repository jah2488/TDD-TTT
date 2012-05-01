module TicTacToe
  class MultiPlayerGame < Game

    def initialize(output, input)
      super
    end

    def start
      @output.puts "Its Xs Turn"
    end

    def start_turn
      @output.puts "Its #{@current_player}s Turn"
    end

    def move(space)
      @board.move(space, @current_player)
      @output.puts @board.print
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
