module BoardScene

  class Output
    def initialize(scene)
      @status = scene.find("status")
    end

    def puts(message)
      @status.text = message
    end
  end

  def start
    create_game
  end

  def create_game
    output = Output.new(scene)
    @game = TicTacToe::SinglePlayerGame.new(output)
  end

end
