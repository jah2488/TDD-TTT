module TicTacToe
  class Board

    def initialize
      @cells = { :a1 => " ", :a2 => " ", :a3 => " ",
                 :b1 => " ", :b2 => " ", :b3 => " ",
                 :c1 => " ", :c2 => " ", :c3 => " " }
    end

    def cells
      @cells
    end

    def print
      board = <<-BOARD
      A - #{@cells[:a1]} | #{@cells[:a2]} | #{@cells[:a3]}  
        ------------
      B - #{@cells[:b1]} | #{@cells[:b2]} | #{@cells[:b3]}  
        ------------
      C - #{@cells[:c1]} | #{@cells[:c2]} | #{@cells[:c3]}  
          1 | 2 | 3 \n
      BOARD
    end

    def move(space, type)
      @cells[space.to_sym] = type
    end

    def open_spaces
      spaces = 0
      @cells.values.each do |cell|
        spaces += 1 if cell == " "
      end
      return spaces
    end

    def game_over?
      return true if winner
      return true if open_spaces < 1
      false
    end

    def winner
      return 'X' if player_wins?('X')
      return 'O' if player_wins?('O')
      return nil
    end

    def player_wins?(type)
      response = false
      winning_moves.each do |move_set|
        if move_set.all? { |cell| cell == type }
          response = true
          break
        else
          response = false
        end
      end
      return response
    end

    def winning_moves
      [
        [@cells[:a1], @cells[:a2], @cells[:a3]],
        [@cells[:b1], @cells[:b2], @cells[:b3]],
        [@cells[:c1], @cells[:c2], @cells[:c3]],

        [@cells[:a1], @cells[:b1], @cells[:c1]],
        [@cells[:a2], @cells[:b2], @cells[:c2]],
        [@cells[:a3], @cells[:b3], @cells[:c3]],

        [@cells[:a1], @cells[:b2], @cells[:c3]],
        [@cells[:a3], @cells[:b2], @cells[:c1]],
      ]
    end

  end
end
