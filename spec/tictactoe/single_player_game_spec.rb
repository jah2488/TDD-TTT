require 'spec_helper'

module TicTacToe
  describe SinglePlayerGame do
    let(:output) { double('output').as_null_object    }
    let(:input)  { double('input').as_null_object     }
    let(:game)   { SinglePlayerGame.new(output, input) }
  end
end
