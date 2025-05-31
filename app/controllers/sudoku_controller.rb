class SudokuController < ApplicationController
  def index
  end

  def create
    values = params[:puzzle].map(&:to_i)
    board = GameBoard.new(*values)
    solution = Game.solve(board)
    redirect_to sudoku_show_path solution: solution.to_s
  end

  def show
    @solution = params[:solution] || ""
  end
end
