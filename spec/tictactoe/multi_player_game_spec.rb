require 'spec_helper'

module TicTacToe
  describe MultiPlayerGame do
    let(:output) { double('output').as_null_object    }
    let(:input)  { double('input').as_null_object     }
    let(:game)   { MultiPlayerGame.new(output, input) }


    describe ".get_input" do

      it "should only accept available board moves" do
        output.should_receive(:print).with("-> ")
      end
    end
    describe ".move" do

      it "should send the players move to the board" do
        game.move('a1')
        game.board.cells[:a1].should == "X"
      end

    end

    describe ".end_turn" do

     it "should call player switch" do
       game.should_receive(:switch_players)
       game.end_turn
     end
    end

    describe ".game_over?" do

      it "should return true if player wins" do
        game.move('a1')
        game.move('b1')
        game.move('a2')
        game.move('b3')
        game.move('a3')
        game.board.game_over?.should == true
      end
    end

    describe ".switch_current_player" do

      context "When X is the Current Player" do
        it "should make O the current player" do
          game.move('1')
          game.end_turn
          game.current_player.should == 'O'
        end
      end

      context "When O is the current_player" do
        it "should make X the current_player" do
          game.move('7')
          game.move('1')
          game.current_player.should == 'X'
        end
      end

      it "should not get confused" do
        game.move('2')
        game.end_turn
        game.current_player.should == "O"
        game.move('3')
        game.end_turn
        game.current_player.should == "X"
        game.move('4')
        game.end_turn
        game.current_player.should == "O"
        game.move('9')
        game.end_turn
        game.current_player.should == "X"
      end
    end
  end
end
