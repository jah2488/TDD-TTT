module TicTacToe
  class Game

    attr_accessor :player_type, :current_player, :other_player, :board

    def initialize(output)
      @output = output
      @player_type = ""
      @current_player = "X"
      @other_player = "O"
      @board = Board.new
    end

    def start
      @output.puts "Tic Tac Toe"
      @output.puts "How many players are there? (1) or (2)"
    end

  end
end
