module TicTacToe
  class ComputerPlayer
    attr_accessor :type

    def initialize(type)
      @type = type
      @moves = {}
    end

    def make_move(board)
      best_move(board)
      return @best_move
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
      current_board = board.dup
      negamax(current_board, @type, 1)
    end

    def negamax(board, player, depth)
      if board.game_over?
        return winner(board, player)
      else
        best_rank = -999
        opponent = opponent(player)

        board.open_cells.each do |cell|
          current_board = board.dup
          current_board.move(cell, player)
          rank = -negamax(current_board, opponent, depth + 1)
          if rank > best_rank
            best_rank = rank
            @best_move = cell if depth == 1
          end
        end
        return best_rank
      end
    end

  end
end
