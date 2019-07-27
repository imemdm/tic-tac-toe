class Round
  def initialize(players)
    @players = players.dup
    @board = Board.new
  end
  
  # Play a single round of Tic Tac Toe 
  # by asking each player successively for 
  # input, with a stop condition if there is a winner
  def play
    loop do 
      board.draw
      turn(by: players.first)

      if active_player.won?(
        positions: board.extract_player_positions(sign: active_player.sign),
        conditions: board.win_conditions
      )
        board.draw
        print_winner(active_player)
        active_player.increase_score
        break
      end

      if board.full?
        board.draw
        print_draw
        break
      end

      players.reverse!
    end
  end

  private

  attr_accessor :players

  def turn(by:)
    pos = nil
    loop do
      pos = by.get_input
      break if board.valid_position?(position: pos)
    end
    board.add_mark(mark: by.sign, position: pos)
  end

  end

  # Shows who won the particular round in the console 
  def print_winner(player)
    puts "#{player.name} has won the round."
  end

  def print_draw
    puts "No winner"
  end
end