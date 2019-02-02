class Round
  def initialize(p1, p2)
    @p1 = p1
    @p2 = p2
    @active_player = p1
    @board = Board.new
  end
  
  # Play a single round of Tic Tac Toe 
  # by asking each player successively for 
  # input, with a stop condition if there is a winner
  def play
    loop do
      board.draw
      turn(by: active_player)

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

      switch_active_player
    end
  end

  private

  attr_accessor :active_player
  attr_reader :p1, :p2, :board

  def turn(by:)
    pos = nil
    loop do
      pos = by.get_input
      break if board.valid_position?(position: pos)
    end
    board.add_mark(mark: by.sign, position: pos)
  end

  def switch_active_player
    if active_player.equal?(p1)
      self.active_player = p2
    else
      self.active_player = p1
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