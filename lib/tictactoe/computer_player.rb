module TicTacToe
  class ComputerPlayer
    attr_accessor :type

    BEST_RANK = 1000
    MAX_DEPTH = 10000

    def initialize(type)
      @type = type
    end

    def make_move(board)
      best_move(board)
    end

    def opponent(piece)
      piece == 'X' ? 'O' : 'X'
    end

    def winner(board, player)
      if board.winner == player
        return 1
      elsif board.winner == opponent(player)
        return -1
      else
        return 0
      end
    end

    def best_move(board)
      moves = board.open_cells.sort_by do |cell|
        current_board = board.dup
        current_board.move(cell, 'O')
        rank_move(current_board, opponent('O'), 1)
      end
      return moves.first
    end

    def rank_move(board, piece, depth)
      winner = board.winner
      if    winner == piece
        return  BEST_RANK - depth
      elsif winner == opponent(piece)
        return -BEST_RANK + depth
      elsif winner == nil || depth > MAX_DEPTH
        return depth
      end

      max_rank = -BEST_RANK
      board.open_cells.each do |cell|
        current_board = board.dup
        current_board.move(cell, piece)
        rank = -rank_move(current_board, opponent(piece), depth + 1)
        max_rank = [max_rank, rank].max
      end
    end

  end
end
