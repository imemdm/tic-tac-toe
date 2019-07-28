class InputHandler
  def self.get(by:)
    ask(player: by)
    
  end

  private

  def ask(player: )
    print "#{player.name}, mark a position on the board (0-8): "
  end
end