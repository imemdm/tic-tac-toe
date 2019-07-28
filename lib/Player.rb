class Player
  attr_reader :name
  attr_accessor :score, :sign

  def initialize(name, sign)
    @name = name
    @sign = sign
    @score = 0
  end

  # Get input from the command line
  def get_input
    ask_for_input
    convert_input(gets.chomp)
  end

  # Returns an integer if input is numeric, nil otherwise
  def convert_input(input)
    if numeric?(input)
      input.to_i
    else
      nil
    end
  end

  def increase_score
    self.score += 1
  end

  private

  # A helper that checks if a given string represents an integer
  def numeric?(str)
    Integer(str) != nil rescue false
  end

  def ask_for_input
    print "#{self.name}, mark a position on the board (0-8): "
  end
end
