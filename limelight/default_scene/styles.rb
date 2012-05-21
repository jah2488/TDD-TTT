# This file, (styles.rb) inside a scene, should define any styles specific to the containing scene.
# It makes use of the StyleBuilder DSL.
#
# For more information see: http://limelightwiki.8thlight.com/index.php/A_Cook%27s_Tour_of_Limelight#Styling_with_styles.rb
# For a complete listing of style attributes see: http://limelightwiki.8thlight.com/index.php/Style_Attributes

default_scene {
  gradient :on
  background_color "#333"
  secondary_background_color "#666"
  width "100%"
  height "100%"
  horizontal_alignment :center

  font_face "Helvetica"
}

title_text {
  gradient :on
  background_color "#333"
  secondary_background_color "#555"

  top_padding 10
  bottom_padding 10
  left_padding 20
  right_padding 20
  rounded_corner_radius 50
  border_color :white
  border_width 7
  hover {
    border_color :black
    text_color   :black
  }

  text_color :white
  font_size  72
  top_margin 30
}

button_box {
  horizontal_alignment :center
  vertical_alignment :center
  margin 250
}

option {
  gradient :on
  background_color "#9e1919"
  secondary_background_color :red

  text_color :white
  font_size 24

  padding 10
  margin 15

  width :auto
  height :auto

  alignment :center

  rounded_corner_radius 5
  border_color "#333"
  border_width 2
  hover {
    secondary_background_color "#9e1919"
    background_color :red
  }
}
