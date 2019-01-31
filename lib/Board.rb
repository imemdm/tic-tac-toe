class Board
  attr_reader :marks

  # All possible winning combinations of board positions
  @@win_combos = [
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]

  def initialize
    @marks = Array.new(9)
  end

  def add_mark(mark:, position:)
    marks[position] = mark
  end

  def valid_position?(position:)
    marks[position].nil? && position >= 0 && position <= 8
  end

  def win_conditions
    @@win_combos
  end

  def draw
    pos = 0
    puts "\n" * 2
    5.times do |row|
      5.times do |col|
        if row % 2 == 0 && col % 2 == 0
          print marks[pos].nil? ? " " : marks[pos]
          pos += 1
        elsif row % 2 == 0 && col % 2 != 0
          print "|"
        else
          print "-"
        end 
      end
      puts "\n"
    end
    puts "\n" * 2
  end
end