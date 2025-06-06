require "rails_helper"

describe GameBoard do
  it "gives all next moves for a given board" do
    @board = GameBoard.new  0, 0, 8, 3, 4, 2, 9, 0, 0,
                            0, 0, 9, 0, 0, 0, 7, 0, 0,
                            4, 0, 0, 0, 0, 0, 0, 0, 3,
                            0, 0, 6, 4, 7, 3, 2, 0, 0,
                            0, 3, 0, 0, 0, 0, 0, 1, 0,
                            0, 0, 2, 8, 5, 1, 6, 0, 0,
                            7, 0, 0, 0, 0, 0, 0, 0, 8,
                            0, 0, 4, 0, 0, 0, 1, 0, 0,
                            0, 0, 3, 6, 9, 7, 5, 0, 0
    @next_move_1 = GameBoard.new 1, 0, 8, 3, 4, 2, 9, 0, 0,
                                 0, 0, 9, 0, 0, 0, 7, 0, 0,
                                 4, 0, 0, 0, 0, 0, 0, 0, 3,
                                 0, 0, 6, 4, 7, 3, 2, 0, 0,
                                 0, 3, 0, 0, 0, 0, 0, 1, 0,
                                 0, 0, 2, 8, 5, 1, 6, 0, 0,
                                 7, 0, 0, 0, 0, 0, 0, 0, 8,
                                 0, 0, 4, 0, 0, 0, 1, 0, 0,
                                 0, 0, 3, 6, 9, 7, 5, 0, 0
    @next_move_2 = GameBoard.new 5, 0, 8, 3, 4, 2, 9, 0, 0,
                                 0, 0, 9, 0, 0, 0, 7, 0, 0,
                                 4, 0, 0, 0, 0, 0, 0, 0, 3,
                                 0, 0, 6, 4, 7, 3, 2, 0, 0,
                                 0, 3, 0, 0, 0, 0, 0, 1, 0,
                                 0, 0, 2, 8, 5, 1, 6, 0, 0,
                                 7, 0, 0, 0, 0, 0, 0, 0, 8,
                                 0, 0, 4, 0, 0, 0, 1, 0, 0,
                                 0, 0, 3, 6, 9, 7, 5, 0, 0
    @next_move_3 = GameBoard.new 6, 0, 8, 3, 4, 2, 9, 0, 0,
                                 0, 0, 9, 0, 0, 0, 7, 0, 0,
                                 4, 0, 0, 0, 0, 0, 0, 0, 3,
                                 0, 0, 6, 4, 7, 3, 2, 0, 0,
                                 0, 3, 0, 0, 0, 0, 0, 1, 0,
                                 0, 0, 2, 8, 5, 1, 6, 0, 0,
                                 7, 0, 0, 0, 0, 0, 0, 0, 8,
                                 0, 0, 4, 0, 0, 0, 1, 0, 0,
                                 0, 0, 3, 6, 9, 7, 5, 0, 0


    expect(@board.next_moves).to eq [@next_move_1, @next_move_2, @next_move_3]
  end


  it "gives all next moves for a given board when the first space is already figured out" do
    @board = GameBoard.new  1, 0, 8, 3, 4, 2, 9, 0, 0,
                            0, 0, 9, 0, 0, 0, 7, 0, 0,
                            4, 0, 0, 0, 0, 0, 0, 0, 3,
                            0, 0, 6, 4, 7, 3, 2, 0, 0,
                            0, 3, 0, 0, 0, 0, 0, 1, 0,
                            0, 0, 2, 8, 5, 1, 6, 0, 0,
                            7, 0, 0, 0, 0, 0, 0, 0, 8,
                            0, 0, 4, 0, 0, 0, 1, 0, 0,
                            0, 0, 3, 6, 9, 7, 5, 0, 0
    @next_move_1 = GameBoard.new 1, 5, 8, 3, 4, 2, 9, 0, 0,
                                 0, 0, 9, 0, 0, 0, 7, 0, 0,
                                 4, 0, 0, 0, 0, 0, 0, 0, 3,
                                 0, 0, 6, 4, 7, 3, 2, 0, 0,
                                 0, 3, 0, 0, 0, 0, 0, 1, 0,
                                 0, 0, 2, 8, 5, 1, 6, 0, 0,
                                 7, 0, 0, 0, 0, 0, 0, 0, 8,
                                 0, 0, 4, 0, 0, 0, 1, 0, 0,
                                 0, 0, 3, 6, 9, 7, 5, 0, 0
    @next_move_2 = GameBoard.new 1, 6, 8, 3, 4, 2, 9, 0, 0,
                                 0, 0, 9, 0, 0, 0, 7, 0, 0,
                                 4, 0, 0, 0, 0, 0, 0, 0, 3,
                                 0, 0, 6, 4, 7, 3, 2, 0, 0,
                                 0, 3, 0, 0, 0, 0, 0, 1, 0,
                                 0, 0, 2, 8, 5, 1, 6, 0, 0,
                                 7, 0, 0, 0, 0, 0, 0, 0, 8,
                                 0, 0, 4, 0, 0, 0, 1, 0, 0,
                                 0, 0, 3, 6, 9, 7, 5, 0, 0
    @next_move_3 = GameBoard.new 1, 7, 8, 3, 4, 2, 9, 0, 0,
                                 0, 0, 9, 0, 0, 0, 7, 0, 0,
                                 4, 0, 0, 0, 0, 0, 0, 0, 3,
                                 0, 0, 6, 4, 7, 3, 2, 0, 0,
                                 0, 3, 0, 0, 0, 0, 0, 1, 0,
                                 0, 0, 2, 8, 5, 1, 6, 0, 0,
                                 7, 0, 0, 0, 0, 0, 0, 0, 8,
                                 0, 0, 4, 0, 0, 0, 1, 0, 0,
                                 0, 0, 3, 6, 9, 7, 5, 0, 0
    expect(@board.next_moves).to eq [@next_move_1, @next_move_2, @next_move_3]
  end

  it "should give the next moves" do
    @board = GameBoard.new 1, 5, 8, 3, 4, 2, 9, 0, 0,
                           0, 0, 9, 0, 0, 0, 7, 0, 0,
                           4, 0, 0, 0, 0, 0, 0, 0, 3,
                           0, 0, 6, 4, 7, 3, 2, 0, 0,
                           0, 3, 0, 0, 0, 0, 0, 1, 0,
                           0, 0, 2, 8, 5, 1, 6, 0, 0,
                           7, 0, 0, 0, 0, 0, 0, 0, 8,
                           0, 0, 4, 0, 0, 0, 1, 0, 0,
                           0, 0, 3, 6, 9, 7, 5, 0, 0
    @next_move_1 = GameBoard.new 1, 5, 8, 3, 4, 2, 9, 6, 0,
                                 0, 0, 9, 0, 0, 0, 7, 0, 0,
                                 4, 0, 0, 0, 0, 0, 0, 0, 3,
                                 0, 0, 6, 4, 7, 3, 2, 0, 0,
                                 0, 3, 0, 0, 0, 0, 0, 1, 0,
                                 0, 0, 2, 8, 5, 1, 6, 0, 0,
                                 7, 0, 0, 0, 0, 0, 0, 0, 8,
                                 0, 0, 4, 0, 0, 0, 1, 0, 0,
                                 0, 0, 3, 6, 9, 7, 5, 0, 0
    expect(@board.next_moves).to eq [@next_move_1]
  end

  describe "valid?" do
    it "returns false when board has the same numbers in the same row" do
      board = GameBoard.new 1, 2, 8, 3, 4, 2, 9, 6, 0,
                    0, 0, 9, 0, 0, 0, 7, 0, 0,
                    4, 0, 0, 0, 0, 0, 0, 0, 3,
                    0, 0, 6, 4, 7, 3, 2, 0, 0,
                    0, 3, 0, 0, 0, 0, 0, 1, 0,
                    0, 0, 2, 8, 5, 1, 6, 0, 0,
                    7, 0, 0, 0, 0, 0, 0, 0, 8,
                    0, 0, 4, 0, 0, 0, 1, 0, 0,
                    0, 0, 3, 6, 9, 7, 5, 0, 0

      expect(board.valid?).to be false
    end

    it "returns false when board has the same numbers in the same column" do
      board = GameBoard.new 1, 2, 8, 3, 4, 2, 9, 6, 0,
                            1, 0, 9, 0, 0, 0, 7, 0, 0,
                            4, 0, 0, 0, 0, 0, 0, 0, 3,
                            0, 0, 6, 4, 7, 3, 2, 0, 0,
                            0, 3, 0, 0, 0, 0, 0, 1, 0,
                            0, 0, 2, 8, 5, 1, 6, 0, 0,
                            7, 0, 0, 0, 0, 0, 0, 0, 8,
                            0, 0, 4, 0, 0, 0, 1, 0, 0,
                            0, 0, 3, 6, 9, 7, 5, 0, 0

      expect(board.valid?).to be false
    end

    it "returns false when board has the same numbers in the same subsquare" do
      board = GameBoard.new 1, 2, 8, 3, 4, 2, 9, 6, 0,
                            0, 1, 9, 0, 0, 0, 7, 0, 0,
                            4, 0, 0, 0, 0, 0, 0, 0, 3,
                            0, 0, 6, 4, 7, 3, 2, 0, 0,
                            0, 3, 0, 0, 0, 0, 0, 1, 0,
                            0, 0, 2, 8, 5, 1, 6, 0, 0,
                            7, 0, 0, 0, 0, 0, 0, 0, 8,
                            0, 0, 4, 0, 0, 0, 1, 0, 0,
                            0, 0, 3, 6, 9, 7, 5, 0, 0

      expect(board.valid?).to be false
    end

    it "returns true when there are no violations on the board" do
      board = GameBoard.new 1, 0, 8, 3, 4, 2, 9, 0, 0,
                    0, 0, 9, 0, 0, 0, 7, 0, 0,
                    4, 0, 0, 0, 0, 0, 0, 0, 3,
                    0, 0, 6, 4, 7, 3, 2, 0, 0,
                    0, 3, 0, 0, 0, 0, 0, 1, 0,
                    0, 0, 2, 8, 5, 1, 6, 0, 0,
                    7, 0, 0, 0, 0, 0, 0, 0, 8,
                    0, 0, 4, 0, 0, 0, 1, 0, 0,
                    0, 0, 3, 6, 9, 7, 5, 0, 0

      expect(board.valid?).to be true
    end
  end
end