require 'spec_helper'

module TicTacToe
  describe Game do

    describe "#start" do

      let(:output) { double('output').as_null_object }
      let(:input)  { double('input').as_null_object  }
      let(:game)   { Game.new(output, input)         }

      it "shows the menu" do
        output.should_receive(:puts).with('Tic Tac Toe')
        game.start
      end

      it "asks for users desired type" do
        output.should_receive(:puts).with('How many players are there? (1) or (2)')
        game.start
      end

    end
  end
end
