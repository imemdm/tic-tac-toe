class Player
  attr_reader :name
  attr_accessor :score, :sign

  def initialize(name, sign)
    @name = name
    @sign = sign
    @score = 0
  end

  # Records a mark in the internal data structure
  def mark(pos, marks)
    pos = pos - 1
    marks[pos] = @sign
  end

  # Continuously asks for valid input, until given,
  # then proceeds with marking
  def get_input(marks)
    loop do 
      ask_for_input
      pos = gets.chomp.to_i
      if valid_mark?(pos, marks)
        mark(pos, marks)
        break
      end
    end
  end

  # Checks if a player has a winning combination of
  # marked positions by comparing all of the possible
  # combinations of his marks with the win combinations
  def won?(marks, win_combos)
    marked_positions = extract_mark_positions(marks)
    pos_combos = marked_positions.combination(3).to_a

    pos_combos.any? do |combo|
      win_combos.include?(combo)
    end
  end

  def increase_score
    self.score += 1
  end

  private
  # Check if the player is allowed to mark the
  # square in question
  def valid_mark?(pos, marks)
    pos = pos - 1
    marks[pos].nil? && (pos >= 0 && pos <= 8)
  end

  # Gets the board positions of player's marks
  def extract_mark_positions(marks)
    positions = []
    marks.each_with_index do |m, id|
      positions << id if self.sign == m
    end
    positions
  end

  # Prints a message for UX purposes
  def ask_for_input
    print "#{self.name}, mark a position on the board (1-9): "
  end
end
