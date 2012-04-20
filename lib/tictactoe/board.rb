module TicTacToe
  class Board

    def initialize
      @cells = "1,2,3,4,5,6,7,8,9"
    end

    def cells
      @cells
    end

    def move(space, type)
      @cells[space] = type
    end

    def player_win?

    end

  end
end
