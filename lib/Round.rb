class Round
  def initialize(players)
    @players = players.dup
    @board = Board.new
  end
  
  # Play a single round of Tic Tac Toe 
  # by asking each player successively for 
  # input, with a stop condition if there is a winner
  def play
    until game_over? 
      board.draw
      turn(player: players.first)

      if active_player.won?(
        positions: board.extract_player_positions(sign: active_player.sign),
        conditions: board.win_conditions
      )
        board.draw
        print_winner(active_player)
        active_player.increase_score
        break
      end

      players.reverse!
    end
    complete
  end

  private

  attr_accessor :players

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
      pos = player.get_input
      break if board.valid_position?(position: pos)
    end
    board.add_mark(mark: by.sign, position: pos)
  end

  def complete
    puts "No winner. Board is full." if full?
    show_winner(players.last) if won?
  end

  # Shows who won the particular round in the console 
  def print_winner(player)
    puts "#{player.name} has won the round."
  end
end