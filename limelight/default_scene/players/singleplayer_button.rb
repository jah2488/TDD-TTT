module SingleplayerButton
  def mouse_clicked(e)
    scene.load('board_scene').start_singleplayer_game
  end
end
