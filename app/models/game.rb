class Game
  def self.solve(board)
    if board.solved?
      return board
    end

    possible_moves = board.next_moves

    possible_moves.each{|move|
      board = Game.solve(move)

      if board && board.solved?
        return board
      end
    }

    return nil
  end
end