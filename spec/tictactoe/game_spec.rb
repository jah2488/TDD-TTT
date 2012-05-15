require 'spec_helper'

module TicTacToe
  describe Game do

    let(:output) { double('output').as_null_object }
    let(:input)  { double('input').as_null_object  }
    let(:game)   { Game.new(output, input)         }


    describe "get_computer_type" do
      it "Should ask the user their desired type" do
        game.stub(:input).and_return('X')
      end

      it "should return the opposite type for the computer" do
        game.stub(:input).and_return('X')
        game.get_computer_type.should == 'O'
      end
    end


  end
end
