class SudokuController < ApplicationController
  def index
    @error = params[:error]
  end

  def create
    values = params[:puzzle].map(&:to_i)
    board = GameBoard.new(*values)

    if !board.valid?
      return redirect_to sudoku_index_path error: "Invalid puzzle"
    end

    solution = Game.solve(board)

    redirect_to sudoku_show_path solution: solution.to_s
  end

  def show
    @solution = params[:solution] || ""
  end
end
