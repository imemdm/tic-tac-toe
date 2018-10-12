class Player
  attr_reader :name, :score

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

  # Check if the player is allowed to mark the
  # square in question
  def valid_mark?(pos, marks)
    pos = pos - 1
    marks[pos].nil? && (pos >= 0 && pos <= 8)
  end

  # Prints a message for UX purposes
  def ask_for_input
    print "#{self.name}, mark a position on the board (1-9) "
  end
end
