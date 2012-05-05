require 'spec_helper'

module TicTacToe
  describe Game do

    describe "#start" do

      let(:output) { double('output').as_null_object }
      let(:input)  { double('input').as_null_object  }
      let(:game)   { Game.new(output, input)         }

    end
  end
end
