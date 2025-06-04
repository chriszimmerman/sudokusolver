module SudokuHelper
  def solution_classes(index)
    base_classes = "w-10 text-2xl text-center border"
    right_border_indexes = [2, 5, 11, 14, 20, 23, 29, 32, 38, 41, 47, 50, 56, 59, 65, 68, 74, 77]
    bottom_border_indexes = [18, 19, 20, 21, 22, 23, 24, 25, 26, 45, 46, 47, 48, 49, 50, 51, 52, 53]

    if right_border_indexes.include?(index)
      base_classes.concat(" border-r-4")
    end

    if bottom_border_indexes.include?(index)
      base_classes.concat(" border-b-4")
    end

    base_classes
  end
end
