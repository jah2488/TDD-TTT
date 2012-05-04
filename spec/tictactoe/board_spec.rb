require 'spec_helper'

module TicTacToe
  describe Board do

    let(:board) do
      Board.new
    end

    let(:blank_board) do
      { :a1 => " ", :a2 => " ", :a3 => " ",
        :b1 => " ", :b2 => " ", :b3 => " ",
        :c1 => " ", :c2 => " ", :c3 => " " }
    end

    describe 'new' do
      it "should start a new board" do
        board.cells.should == blank_board
      end
    end

    describe "cells" do
      it "should return the board's cells" do
        board.cells.should == blank_board
      end
    end

    describe "print" do
      it "should format the board for the console" do
        output = <<-BOARD
      A -  |  |   
        ------------
      B -  |  |   
        ------------
      C -  |  |   
          1 | 2 | 3 \n
      BOARD
        board.print.should == output
      end
    end

    describe "move" do
      it "should set moves on board to player type" do
        board.move('a1','X')
        blank_board[:a1] = 'X'
        board.cells.should == blank_board
      end
    end

    describe "open_spaces" do
      it "should return 9 if no moves are made" do
        board.open_spaces.should == 9
      end
    end
    describe "game_over?" do

      it "should return true if player X wins" do
        board.move('a1','X')
        board.move('a2','X')
        board.move('a3','X')

        board.game_over?.should == true
      end

      it "should return true if player O win" do
        board.move('a1', 'O')
        board.move('a2', 'O')
        board.move('a3', 'O')
        board.game_over?.should == true
      end

      it "should return false if player doesn't win" do
        board.move('a1', 'O')
        board.move('a2', 'X')
        board.move('a3', 'O')
        board.game_over?.should == false
      end
    end

    describe "player_wins?" do

      it "should return true if player X wins" do
        board.move('a1','X')
        board.move('a2','X')
        board.move('a3','X')

        board.player_wins?('X').should == true
      end

      it "should return true if player X wins" do
        board.move('a1','O')
        board.move('b2','O')
        board.move('c3','O')

        board.player_wins?('O').should == true
      end

      it "should return true if player X wins" do
        board.move('a3','X')
        board.move('b2','X')
        board.move('c1','X')

        board.player_wins?('X').should == true
      end

      it "should return true if player X wins" do
        board.move('a1','X')
        board.move('b1','O')
        board.move('c1','X')

        board.player_wins?('X').should == false
      end

    end
  end
end
