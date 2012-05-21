# This file, (styles.rb) inside a scene, should define any styles specific to the containing scene.
# It makes use of the StyleBuilder DSL.
#
# For more information see: http://limelightwiki.8thlight.com/index.php/A_Cook%27s_Tour_of_Limelight#Styling_with_styles.rb
# For a complete listing of style attributes see: http://limelightwiki.8thlight.com/index.php/Style_Attributes

board_scene {
  gradient :on
  background_color "#333"
  secondary_background_color "#666"
  width "100%"
  height "100%"
  horizontal_alignment :center

  font_face "Helvetica"
  padding 20
}

moves {
  text_color :white
  font_size 18
}

status {
  extends :moves
}

board {
  gradient :on
  background_color "#777"
  secondary_background_color "#AAA"

  top_margin 50
  padding 5
  border_width 1
  top_border_color "#999"
  left_border_color "#999"
  right_border_color "#555"
  bottom_border_color "#555"
  alignment :center
}
row {
}
cell {
  gradient :on
  background_color "#AAA"
  secondary_background_color "#CCC"
  margin 2
  border_width 1
  top_border_color "#777"
  left_border_color "#777"
  right_border_color "#333"
  bottom_border_color "#333"
  width 150
  height 150

  alignment :center
  text_color :white
  font_size 100

  hover {
   background_color "#777"
   secondary_background_color "#999"
  }
}
