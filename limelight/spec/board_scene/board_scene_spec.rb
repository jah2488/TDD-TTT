require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")

describe "Board Scene" do

  uses_limelight :scene => "board_scene", :hidden => true

  context "players" do

    context "start single player game" do
      it "should create board, player, and game" do
        scene.start_singleplayer_game
      end
    end

    context "start multi player game" do
      it "should create board, player, and game" do
        scene.start_multiplayer_game
      end
    end

    context "create_game" do
      it "should create and return a new game object" do
        scene.start_singleplayer_game
        scene.game.class.should == TicTacToe::Game
      end
    end

    context "move" do
      before(:each) do
        scene.start_singleplayer_game
        scene.move('a1')
      end
      it "should place players move on the board" do
        scene.find('a1').text.should == 'X'
      end
      it "should set the game board space" do
        scene.game.board.cells[:a1].should == 'X'
      end
      it "should switch players" do
        scene.game.current_player.should == 'O'
      end
    end

    context "handle_move" do
      before(:each) do
        scene.start_multiplayer_game
      end
      it "should call move for current player" do
        scene.should_receive(:move).with('a1')
        scene.handle_move('a1')
      end
      it "should check board status" do
        scene.should_receive(:game_state)
        scene.handle_move('a1')
      end
      it "should update text fields" do
        scene.should_receive(:update_display)
        scene.handle_move('a1')
      end
      it "should call the computer turn" do
        scene.should_receive(:computer_turn)
        scene.handle_move('a1')
      end
      it "should change turns" do
        scene.handle_move('a1')
        scene.game.current_player.should == 'O'
      end
    end

    context "computer_turn" do
      it "should make the computer's move" do
        scene.start_singleplayer_game
        scene.handle_move('a1')
        scene.find('moves').text.should == "7 moves left"
      end
    end

    context "game_state" do
      before(:each) do
        scene.start_singleplayer_game
      end
      it "should call game_over if game has been won" do
        scene.should_receive(:game_over)
        scene.game.stub(:winner => 'X')
        scene.game_state
      end
      it "should call stalemate if no moves are available" do
        scene.should_receive(:stalemate)
        scene.game.stub(:stalemate? => true)
        scene.game_state
      end
    end

    context "game_over" do
      before(:each) do
        scene.start_multiplayer_game
        scene.handle_move('a1')
        scene.handle_move('b1')
        scene.handle_move('a2')
        scene.handle_move('c1')
        scene.handle_move('a3')
      end
      it "should display the game over message" do
        scene.find('status').text.should == "Player X Wins!"
      end
    end

    context "update_display" do
      before(:each) do
        scene.start_multiplayer_game
        scene.handle_move('a1')
      end
      it "should update the moves available" do
        scene.find('moves').text.should == "8 moves left"
      end
      it "should update the output to the current player" do
        scene.find('status').text.should == "Its Player O's Turn"
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
