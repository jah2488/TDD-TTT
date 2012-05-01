module TicTacToe
  require 'rubygems'
  require 'pry'
  class Game

    attr_accessor :player_type, :current_player, :other_player, :board

    def initialize(output, input)
      @output = output
      @input  = input
      @player_type = ""
      @current_player = "X"
      @other_player = "O"
      @board = Board.new
    end

    def start
      @output.puts "Tic Tac Toe"
      @output.puts "How many players are there? (1) or (2)"
      game = @input.gets.chomp == "1" ? SinglePlayerGame.new(@output, @input) : MultiPlayerGame.new(@output, @input)
      game.start
    end

  end
end
