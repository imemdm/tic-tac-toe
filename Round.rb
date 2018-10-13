require "./Board.rb"

class Round
  attr_reader :marks, :p1, :p2
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

  def initialize(p1, p2)
    @p1 = p1
    @p2 = p2
    @marks = Array.new(9)
    @board = Board.new
  end
  
  # Play a single round of Tic Tac Toe 
  # by asking each player successively for 
  # input, with a stop condition if there is a winner
  def play
    Board.draw
    loop do
      break unless next_move(self.p1)
      break unless next_move(self.p2)
    end
  end

  private
  # Sends a message to get player's input, 
  # then checks with another message if the round 
  # has been won with that particular mark. It returns 
  # a boolean so the 'round' loop can be stopped when won. 
  def next_move(player)
    player.get_input(self.marks)
    @board.draw(@marks)
    if player.won?(self.marks, @@win_combos)
      player.increase_score
      print_winner(player)
      return false
    end
    return true
  end

  # Shows who won the particular round in the console 
  def print_winner(player)
    puts "#{player.name} has won the round."
  end
end