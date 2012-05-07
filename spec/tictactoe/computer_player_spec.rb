require 'spec_helper'

module TicTacToe
  describe ComputerPlayer do

    let(:output) { double('output').as_null_object }
    let(:input)  { double('input').as_null_object  }
    let(:game)   { SinglePlayerGame.new(output, input) }
    let(:board)  { Board.new }
    let(:cpu)    { ComputerPlayer.new('O') }

    describe ".make_move" do

      it "should pick best moves" do
        board.move('a1', 'O')
        board.move('c3', 'O')
        cpu.make_move(board).should == :b2
      end
      it "should pick winning moves" do
        board.move('a3', 'O')
        board.move('a2', 'O')
        cpu.make_move(board).should == :a1
      end
      it "should pick winning moves" do
        board.move('a1', 'O')
        board.move('a2', 'O')
        cpu.make_move(board).should == :a3
      end
      it "should pick winning moves" do
        board.move('b2', 'O')
        board.move('b3', 'O')
        cpu.make_move(board).should == :b1
      end
      it "should pick winning moves" do
        board.move('c1', 'O')
        board.move('b2', 'O')
        cpu.make_move(board).should == :a3
      end
      it "should pick winning moves" do
        board.move('a1', 'O')
        board.move('b2', 'O')
        cpu.make_move(board).should == :c3
      end
      it "should pick winning moves" do
        board.move('c3', 'O')
        board.move('b3', 'O')
        cpu.make_move(board).should == :a3
      end
      it "should pick best moves" do
        board.move('a1', 'X')
        board.move('c3', 'X')
        cpu.make_move(board).should == :b2
      end
      it "should pick blocking moves" do
        board.move('a3', 'X')
        board.move('a2', 'X')
        cpu.make_move(board).should == :a1
      end
      it "should pick blocking moves" do
        board.move('a1', 'X')
        board.move('a2', 'X')
        cpu.make_move(board).should == :a3
      end
      it "should pick blocking moves" do
        board.move('b2', 'X')
        board.move('b3', 'X')
        cpu.make_move(board).should == :b1
      end
      it "should pick blocking moves" do
        board.move('c1', 'X')
        board.move('b2', 'X')
        cpu.make_move(board).should == :a3
      end
      it "should pick blocking moves" do
        board.move('a1', 'X')
        board.move('b2', 'X')
        cpu.make_move(board).should == :c3
      end
      it "should pick blocking moves" do
        board.move('c3', 'X')
        board.move('b3', 'X')
        cpu.make_move(board).should == :a3
      end
   end

    describe ".opponent" do

      it "should return the opponent type" do
        cpu.opponent('O').should == 'X'
      end

      it "should return the opponent type when X" do
        cpu.opponent('X').should == 'O'
      end

    end

    describe ".check_winner" do
      it "should 1 if computer wins" do
        board.move(:a1,'O')
        board.move(:a2,'O')
        board.move(:a3,'O')
        cpu.winner(board, 'O').should == 1
      end
      it "should return -1 if opponent wins" do
        board.move(:a1,'X')
        board.move(:b2,'X')
        board.move(:c3,'X')
        cpu.winner(board, 'O').should == -1
      end
      it "should return 0 if the game is a tie" do
        cpu.winner(board, 'O').should == 0
      end
    end

  end
end
