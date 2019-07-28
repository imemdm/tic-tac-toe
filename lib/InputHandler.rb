class InputHandler
  def self.get(from:)
    input = nil
    until input
      ask(player: from)
      input = convert_input(gets.chomp)
    end
    input
  end

  private

  # Returns an integer if input is numeric, nil otherwise
  def self.convert_input(input)
    input.to_i - 1 if numeric?(input)
  end

  # A helper that checks if a given string represents an integer
  def self.numeric?(str)
    Integer(str) != nil rescue false
  end

  def self.ask(player: )
    print "#{player.name}(#{player.sign}), mark a position on the board (1-9): "
  end
end