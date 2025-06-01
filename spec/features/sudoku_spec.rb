require 'spec_helper'

RSpec.describe "sudoku" do
  feature "solving a puzzle" do
    numbers = [0, 0, 8, 3, 4, 2, 9, 0, 0,
               0, 0, 9, 0, 0, 0, 7, 0, 0,
               4, 0, 0, 0, 0, 0, 0, 0, 3,
               0, 0, 6, 4, 7, 3, 2, 0, 0,
               0, 3, 0, 0, 0, 0, 0, 1, 0,
               0, 0, 2, 8, 5, 1, 6, 0, 0,
               7, 0, 0, 0, 0, 0, 0, 0, 8,
               0, 0, 4, 0, 0, 0, 1, 0, 0,
               0, 0, 3, 6, 9, 7, 5, 0, 0]

    solution_numbers = [6, 7, 8, 3, 4, 2, 9, 5, 1,
                       3, 2, 9, 1, 8, 5, 7, 6, 4,
                       4, 5, 1, 7, 6, 9, 8, 2, 3,
                       5, 1, 6, 4, 7, 3, 2, 8, 9,
                       8, 3, 7, 9, 2, 6, 4, 1, 5,
                       9, 4, 2, 8, 5, 1, 6, 3, 7,
                       7, 6, 5, 2, 1, 4, 3, 9, 8,
                       2, 9, 4, 5, 3, 8, 1, 7, 6,
                       1, 8, 3, 6, 9, 7, 5, 4, 2]

    scenario "entering a puzzle and asking for the solution" do
      visit "/"
      expect(page).to have_content("Sudoku Solver")

      all('#puzzle').each_with_index do |element, index|
        element.set(numbers[index])
      end

      click_on("Solve")

      expect(page).to have_content("Solution")
      expect(page).to have_content(solution_numbers[0..8].join(" "))
      expect(page).to have_content(solution_numbers[9..17].join(" "))
      expect(page).to have_content(solution_numbers[18..26].join(" "))
      expect(page).to have_content(solution_numbers[27..35].join(" "))
      expect(page).to have_content(solution_numbers[36..44].join(" "))
      expect(page).to have_content(solution_numbers[45..53].join(" "))
      expect(page).to have_content(solution_numbers[54..62].join(" "))
      expect(page).to have_content(solution_numbers[63..71].join(" "))
      expect(page).to have_content(solution_numbers[72..80].join(" "))
    end
  end
end
