class InputHandler
  def self.get
    ask_for_input
  end

  private

  def ask_for_input
    print "#{self.name}, mark a position on the board (0-8): "
  end
end