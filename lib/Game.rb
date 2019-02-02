class Game
  def initialize(p1_name, p2_name, rounds)
    @player1 = Player.new(p1_name, "x")
    @player2 = Player.new(p2_name, "o")
    @rounds = rounds.to_i
    @game_winner = nil
    @first = @player1
    @second = @player2
  end

  # Runs the entire game
  def start
    welcome_screen
    @rounds.times do
      round = Round.new(first, second)
      round.play
      flip_players
    end
    settle
    ending_screen
  end

  private

  attr_accessor :player1, :player2, :rounds, :game_winner, :first, :second 

  def flip_players
    if first.equal?(player1)
      self.first = player2
      self.second = player1
    else
      self.first = player1
      self.second = player2
    end
  end

  # Settles the game by comparing players' scores
  def settle
    if player1.score > player2.score
      self.game_winner = player1
    elsif player2.score > player1.score
      self.game_winner = player2
    else
      self.game_winner = nil
    end
  end

  # Prints a welcome screen indicating the game begins
  def welcome_screen
    puts "#{rounds} rounds will be played."
  end

  # Ends the game by displaying the final result
  def ending_screen
    if game_winner.nil?
      puts "DRAW!"
    else
      puts "#{game_winner.name} has won the game by winning #{game_winner.score} out of #{@rounds}"
    end
  end
end