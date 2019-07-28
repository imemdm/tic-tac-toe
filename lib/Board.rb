class Board
  attr_reader :grid

  # All possible winning combinations of board positions
  WIN_COMBOS = [
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]

  def initialize()
    @grid = Array.new(9)
  end

  def add_mark(mark:, position:)
    grid[position] = mark
  end

  def valid_position?(position:)
    grid[position].nil? && position >= 0 && position <= 8
  end

  def marks_by_player
    ["x", "o"].map do |sign|
      grid.each_with_index
        .select { |mark, pos| mark == sign }
        .map { |p_mark, pos| pos }
    end
  end

  def full?
    !grid.include?(nil)
  end

  def won?
    marks_by_player.each do |marks|
      marks.sort!.combination(3).to_a.each do |combo|
        return true if WIN_COMBOS.include?(combo)
      end
    end
    false
  end

  def draw
    pos = 0
    puts "\n" * 2
    5.times do |row|
      5.times do |col|
        if row % 2 == 0 && col % 2 == 0
          print grid[pos].nil? ? " " : grid[pos]
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