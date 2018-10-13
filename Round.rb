class Round
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
  
  # Play a single round of Tic Tac Toe 
  # by asking each player successively for 
  # input, with a stop condition if there is a winner
  def play(p1, p2)
    loop do
      break unless next_move(p1)
      break unless next_move(p2)
    end
  end

  private
  def next_move(player)
    player.get_input(self.marks)
    if player.won?(self.marks, @@win_combos)
      player.increase_score
      win_message(player)
      return false
    end
    return true
  end

  def win_message(player)
    puts "#{player.name} has won the round."
  end
end