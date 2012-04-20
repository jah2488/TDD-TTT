require 'spec_helper'

module TicTacToe
  describe Board do

    let(:board) do
      Board.new
    end

    describe 'new' do
      it "should start a new board" do
        board.cells.should == "1,2,3,4,5,6,7,8,9"
      end
    end

    describe "cells" do
      it "should return the board's cells" do
        board.cells.should == "1,2,3,4,5,6,7,8,9"
      end
    end

    describe "move" do
      it "should set moves on board to player type" do
        board.move('1','X')
        board.cells.should == "X,2,3,4,5,6,7,8,9"
      end
    end

    describe "player_win?" do
      before(:each) do
        board.move('1','X')
        board.move('2','X')
        board.move('3','X')
      end

      it "should return true if player wins" do
        board.player_win?.should == true
      end
    end
  end
end
