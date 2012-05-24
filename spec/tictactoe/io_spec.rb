require 'spec_helper'

module TicTacToe
  describe InputOutput do

    let(:io) { InputOutput.new }

    context "#output" do
      it "should print the message given" do
        io.output("Tic Tac Toe")
      end
    end
  end
end
