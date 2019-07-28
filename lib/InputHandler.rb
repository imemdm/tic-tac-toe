class InputHandler
  def self.get(from:)
    input = nil
    until convert_input(input)
      ask(player: from)
      input = gets.chomp
    end
    input
  end

  private

  # Returns an integer if input is numeric, nil otherwise
  def convert_input(input)
    input.to_i if numeric?(input)
  end

  # A helper that checks if a given string represents an integer
  def numeric?(str)
    Integer(str) != nil rescue false
  end

  def ask(player: )
    print "#{player.name}, mark a position on the board (0-8): "
  end
end