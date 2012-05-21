# This file (props.rb) defines all the props that appear in a scene when loaded.  It makes use of the
# PropBuilder DSL.
#
# For more information see: http://limelightwiki.8thlight.com/index.php/A_Cook%27s_Tour_of_Limelight#PropBuilder_DSL

moves :text => "9 moves left"

board do
  row :id => "a" do
    cell :id => "a1", :text => "X"
    cell :id => "a2"
    cell :id => "a3"
  end
  row :id => "b" do
    cell :id => "b1"
    cell :id => "b2", :text => "O"
    cell :id => "b3"
  end
  row :id => "c" do
    cell :id => "c1"
    cell :id => "c2"
    cell :id => "c3"
  end
end

status :id => "status", :text => "Its Player X's Turn"

