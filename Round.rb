class Round
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
      p1.get_input(@marks)
      break if p1.won?(@marks, @@win_combos)
      p2.get_input(@marks)
      break if p2.won?(@marks, @@win_combos)
    end
  end
end