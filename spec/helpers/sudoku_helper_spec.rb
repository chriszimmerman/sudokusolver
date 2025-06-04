require 'rails_helper'

RSpec.describe SudokuHelper, type: :helper do
  it "returns the base classes for non-border indexes" do
    expect(solution_classes(0)).to eq("w-10 text-2xl text-center border")
  end

  context "when the index is a right_border index" do
    it "appends the right border class to the classes list" do
      expect(solution_classes(2)).to eq("w-10 text-2xl text-center border border-r-4")
    end
  end

  context "when the index is a bottom_border index" do
    it "appends the bottom border class to the classes list" do
      expect(solution_classes(18)).to eq("w-10 text-2xl text-center border border-b-4")
    end
  end

  context "when the index is both a bottom_border and right_border index" do
    it "appends the bottom border and right border classes to the classes list" do
      expect(solution_classes(23)).to eq("w-10 text-2xl text-center border border-r-4 border-b-4")
    end
  end
end
