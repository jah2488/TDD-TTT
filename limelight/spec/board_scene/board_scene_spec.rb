require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")

describe "Board Scene" do

  uses_limelight :scene => "board_scene", :hidden => true

  context "players" do


    it "should create board, player, and game" do
      scene.should_receive(:create_game)
      scene.start
    end

    context "create_game" do
      it "should create and return a new game object" do
        scene.create_game.class.should == TicTacToe::SinglePlayerGame
      end
    end

  end

  context "props" do
    it "should have 3 children" do
      scene.children.size.should == 3
      moves = scene.children[0]
      moves.text.should == "9 moves left"
    end

    context "board" do
      before(:each) do
        @board = scene.children[1]
      end
      it "should have 3 children" do
        @board.children.size.should == 3
      end
      context "row" do
        before(:each) do
          @row = @board.children[0]
        end
        it "should contain 3 children" do
          @row.children.size.should == 3
        end
      end
    end
  end

end
