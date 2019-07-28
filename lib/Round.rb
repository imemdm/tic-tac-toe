class Round
  def initialize(players)
    @players = players.dup
    @board = Board.new
  end
  
  # Play a single round of Tic Tac Toe 
  # by asking each player successively for 
  # input, with a stop condition if there is a winner
  def play
    board.draw
    until game_over?
      turn(player: players.first)
      board.draw
      players.reverse!
    end
    complete
  end

  private

  attr_accessor :players, :board

  def game_over?
    full? || won?
  end

  def full?
    board.full?
  end

  def won?
    board.won?
  end

  def turn(player:)
    pos = nil
    loop do
      pos = InputHandler.get(from: player)
      break if board.valid_position?(position: pos)
    end
    board.add_mark(mark: player.sign, position: pos)
  end

  # Runs only after the completion of each round
  def complete
    if won?
      players.last.increase_score
      show_winner(players.last)
    else
      puts "No winner. Board is full."
    end
  end

  # Shows who won the particular round in the console 
  def print_winner(player)
    puts "#{player.name} has won the round."
  end
end