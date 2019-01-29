class Player
  attr_reader :name, :positions
  attr_accessor :score, :sign

  def initialize(name, sign)
    @name = name
    @sign = sign
    @score = 0
    @positions = []
  end

  # Records a mark in the internal data structure
  def mark(pos:, opponent_positions:)
    if valid_mark?(pos, opponent_positions)
      positions << pos
      true
    else
      false
    end
  end

  # Continuously tries to mark a valid position
  def get_input
    loop do 
      ask_for_input
      pos = gets.chomp.to_i
      break if mark(pos: pos, opponent_positions: positions) 
    end
  end

  # Checks if a player has a winning combination of
  # marked positions by comparing all of the possible
  # combinations of his positions with the win combinations
  def won?(positions, win_combos)
    marked_positions = extract_mark_positions(positions)
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
  def valid_mark?(pos, opponent_positions)
    !opponent_positions.include?(pos) && (pos >= 0 && pos <= 8)
  end

  # Gets the board positions of player's positions
  def extract_mark_positions(positions)
    positions = []
    positions.each_with_index do |m, id|
      positions << id if self.sign == m
    end
    positions
  end

  # Prints a message for UX purposes
  def ask_for_input
    print "#{self.name}, mark a position on the board (0-8): "
  end
end
