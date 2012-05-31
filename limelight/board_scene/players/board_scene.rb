module BoardScene

  def start_singleplayer_game
    @game = TicTacToe::Game.new
    @game.computer = TicTacToe::ComputerPlayer.new("O")
  end

  def start_multiplayer_game
    @game = TicTacToe::Game.new
  end

  def game
    @game
  end

  def handle_move(space)
    move(space)
    game_state
    computer_turn
  end

  def computer_turn
    if @game.current_player == @game.computer.type
      move = @game.computer.make_move(@game.board)
      handle_move(move)
    end
  end

  def game_state
    if @game.winner
      game_over
    elsif @game.stalemate?
      stalemate
    else
      update_display
    end
  end

  def update_display
    @game.switch_players
    scene.find('moves').text  = "#{@game.moves_left} moves left"
    scene.find('status').text = "Its Player #{@game.current_player}'s Turn"
  end

  def game_over
    scene.find('status').text = "Player #{@game.current_player} Wins!"
  end

  def move(space)
    if scene.find(space).text.empty?
      @game.move(space)
      scene.find(space).text = @game.current_player
    end
  end

end
