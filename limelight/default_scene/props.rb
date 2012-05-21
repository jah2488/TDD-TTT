# This file (props.rb) defines all the props that appear in a scene when loaded.  It makes use of the
# PropBuilder DSL.
# For more information see: http://limelightwiki.8thlight.com/index.php/A_Cook%27s_Tour_of_Limelight#PropBuilder_DSL

title_text  :text => "Tic Tac Toe!"

button_box do
  option :players => "singleplayer_button", :text => "Single Player Game"
  option :players => "multiplayer_button",  :text => "Multiplayer Game"
  option :players => "help_button",         :text => "Help"
  option :players => "exit_button",         :text => "Exit"
end
