require 'set'

class GameBoard
  POSSIBLE_VALUES = [1,2,3,4,5,6,7,8,9]

  def initialize *spaces
    @spaces = []
    spaces.each_with_index do |space, index|
      row_for_space = ROW_MAP[index]
      column_for_space = COLUMN_MAP[index]
      subsquare_for_space = SUBSQUARE_MAP[index]
      space_obj = Space.new(row_for_space, column_for_space, subsquare_for_space, space)
      @spaces.push(space_obj)
    end
  end

  attr_reader :spaces

  def next_moves
    first_empty_space = @spaces.detect{|space| space.value === 0}

    spaces_in_same_row = @spaces.select{|space| space.row === first_empty_space.row}
    spaces_in_same_column = @spaces.select{|space| space.column === first_empty_space.column}
    spaces_in_same_subsquare = @spaces.select{|space| space.subsquare === first_empty_space.subsquare}

    same_row_values = spaces_in_same_row.map(&:value) - [0]
    same_column_values = spaces_in_same_column.map(&:value) - [0]
    same_subsquare_values = spaces_in_same_subsquare.map(&:value) - [0]
    taken_values = same_row_values | same_column_values | same_subsquare_values
    possible_values = (POSSIBLE_VALUES - taken_values).sort

    possible_moves = []
    possible_values.each do |possible_value|
      new_board = GameBoard.new(*@spaces.map(&:value))

      first_empty_space = new_board.spaces.detect{|space| space.value === 0}
      first_empty_space.value = possible_value

      possible_moves.push(new_board)
    end

    possible_moves
  end

  def solved?
    @spaces.none?{|space| space.value === 0}
  end

  def ==(other)
    @spaces.each_with_index do |space, index|
      other_space = other.spaces[index]
      if space.value != other_space.value
        return false
      end
    end

    true
  end

  class Space
    def initialize(row, column, subsquare, value)
      @row = row
      @column = column
      @subsquare = subsquare
      @value = value
    end

    attr_reader :row, :column, :subsquare
    attr_accessor :value
  end

  ROW_MAP = {
    0 => 1,
    1 => 1,
    2 => 1,
    3 => 1,
    4 => 1,
    5 => 1,
    6 => 1,
    7 => 1,
    8 => 1,
    9 => 2,
    10 => 2,
    11 => 2,
    12 => 2,
    13 => 2,
    14 => 2,
    15 => 2,
    16 => 2,
    17 => 2,
    18 => 3,
    19 => 3,
    20 => 3,
    21 => 3,
    22 => 3,
    23 => 3,
    24 => 3,
    25 => 3,
    26 => 3,
    27 => 4,
    28 => 4,
    29 => 4,
    30 => 4,
    31 => 4,
    32 => 4,
    33 => 4,
    34 => 4,
    35 => 4,
    36 => 5,
    37 => 5,
    38 => 5,
    39 => 5,
    40 => 5,
    41 => 5,
    42 => 5,
    43 => 5,
    44 => 5,
    45 => 6,
    46 => 6,
    47 => 6,
    48 => 6,
    49 => 6,
    50 => 6,
    51 => 6,
    52 => 6,
    53 => 6,
    54 => 7,
    55 => 7,
    56 => 7,
    57 => 7,
    58 => 7,
    59 => 7,
    60 => 7,
    61 => 7,
    62 => 7,
    63 => 8,
    64 => 8,
    65 => 8,
    66 => 8,
    67 => 8,
    68 => 8,
    69 => 8,
    70 => 8,
    71 => 8,
    72 => 9,
    73 => 9,
    74 => 9,
    75 => 9,
    76 => 9,
    77 => 9,
    78 => 9,
    79 => 9,
    80 => 9,
  }

  COLUMN_MAP = {
    0 => 1,
    1 => 2,
    2 => 3,
    3 => 4,
    4 => 5,
    5 => 6,
    6 => 7,
    7 => 8,
    8 => 9,
    9 => 1,
    10 => 2,
    11 => 3,
    12 => 4,
    13 => 5,
    14 => 6,
    15 => 7,
    16 => 8,
    17 => 9,
    18 => 1,
    19 => 2,
    20 => 3,
    21 => 4,
    22 => 5,
    23 => 6,
    24 => 7,
    25 => 8,
    26 => 9,
    27 => 1,
    28 => 2,
    29 => 3,
    30 => 4,
    31 => 5,
    32 => 6,
    33 => 7,
    34 => 8,
    35 => 9,
    36 => 1,
    37 => 2,
    38 => 3,
    39 => 4,
    40 => 5,
    41 => 6,
    42 => 7,
    43 => 8,
    44 => 9,
    45 => 1,
    46 => 2,
    47 => 3,
    48 => 4,
    49 => 5,
    50 => 6,
    51 => 7,
    52 => 8,
    53 => 9,
    54 => 1,
    55 => 2,
    56 => 3,
    57 => 4,
    58 => 5,
    59 => 6,
    60 => 7,
    61 => 8,
    62 => 9,
    63 => 1,
    64 => 2,
    65 => 3,
    66 => 4,
    67 => 5,
    68 => 6,
    69 => 7,
    70 => 8,
    71 => 9,
    72 => 1,
    73 => 2,
    74 => 3,
    75 => 4,
    76 => 5,
    77 => 6,
    78 => 7,
    79 => 8,
    80 => 9,
  }

  SUBSQUARE_MAP = {
    0 => 1,
    1 => 1,
    2 => 1,
    3 => 2,
    4 => 2,
    5 => 2,
    6 => 3,
    7 => 3,
    8 => 3,
    9 => 1,
    10 => 1,
    11 => 1,
    12 => 2,
    13 => 2,
    14 => 2,
    15 => 3,
    16 => 3,
    17 => 3,
    18 => 1,
    19 => 1,
    20 => 1,
    21 => 2,
    22 => 2,
    23 => 2,
    24 => 3,
    25 => 3,
    26 => 3,
    27 => 4,
    28 => 4,
    29 => 4,
    30 => 5,
    31 => 5,
    32 => 5,
    33 => 6,
    34 => 6,
    35 => 6,
    36 => 4,
    37 => 4,
    38 => 4,
    39 => 5,
    40 => 5,
    41 => 5,
    42 => 6,
    43 => 6,
    44 => 6,
    45 => 4,
    46 => 4,
    47 => 4,
    48 => 5,
    49 => 5,
    50 => 5,
    51 => 6,
    52 => 6,
    53 => 6,
    54 => 7,
    55 => 7,
    56 => 7,
    57 => 8,
    58 => 8,
    59 => 8,
    60 => 9,
    61 => 9,
    62 => 9,
    63 => 7,
    64 => 7,
    65 => 7,
    66 => 8,
    67 => 8,
    68 => 8,
    69 => 9,
    70 => 9,
    71 => 9,
    72 => 7,
    73 => 7,
    74 => 7,
    75 => 8,
    76 => 8,
    77 => 8,
    78 => 9,
    79 => 9,
    80 => 9,
  }
end