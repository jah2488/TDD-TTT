require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")

describe "Default Scene" do

  uses_limelight :scene => "default_scene", :hidden => true

  context "Scene" do
    it "should have 5 children elements" do
      scene.children.size.should == 2
    end
    context "button_box" do
      it "should contain 4 elements" do
        scene.children[1].children.size.should == 4
      end
    end
  end

  context "Props" do
    before(:each) do
      @box = scene.children[1]
    end

    it "should have menu text" do
      prop = scene.children[0]
      prop.text.should == "Tic Tac Toe!"
    end
    it "should have single player options" do
      prop = @box.children[0]
      prop.text.should == "Single Player Game"
    end
    it "should have multiplayer option" do
      prop = @box.children[1]
      prop.text.should == "Multiplayer Game"
    end
    it "should have help option" do
      prop = @box.children[2]
      prop.text.should == "Help"
    end
    it "should have exit option" do
      prop = @box.children[3]
      prop.text.should == "Exit"
    end
  end

  context "Players" do
  end

end
