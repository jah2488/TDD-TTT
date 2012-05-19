require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")

describe "Default Scene" do

  uses_limelight :scene => "default_scene", :hidden => true

  context "Scene" do
    it "should have 5 children elements" do
      scene.children.size.should == 5
    end
  end

  context "Props" do
    it "should have menu text" do
      prop = scene.children[0]
      prop.text.should == "Tic Tac Toe!"
    end
    it "should have single player options" do
      prop = scene.children[1]
      prop.text.should == "New Single Player Game"
    end
    it "should have multiplayer option" do
      prop = scene.children[2]
      prop.text.should == "New Multiplayer Game"
    end
    it "should have help option" do
      prop = scene.children[3]
      prop.text.should == "Help"
    end
    it "should have exit option" do
      prop = scene.children[4]
      prop.text.should == "Exit"
    end
  end

  context "Players" do
  end

end
