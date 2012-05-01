module TicTacToe
  class MultiPlayerGame < Game

    def initialize(output)
      super
    end


    def start(player_type)
      @player_type = player_type
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

  end
end
