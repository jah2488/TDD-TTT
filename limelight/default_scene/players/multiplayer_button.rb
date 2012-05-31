module MultiplayerButton
  def mouse_clicked(e)
    scene.load('board_scene').start_multiplayer_game
  end
end
