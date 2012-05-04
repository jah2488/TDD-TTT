require 'spec_helper'

module TicTacToe
  describe SinglePlayerGame do
    let(:output) { double('output').as_null_object    }
    let(:input)  { double('input').as_null_object     }
    let(:game)   { SinglePlayerGame.new(output, input) }

    describe ".start" do

      it "should prompt the user for their move" do
        output.should_receive(:puts).with("Its Xs Turn")
        game.start
      end

    end


  end
end
