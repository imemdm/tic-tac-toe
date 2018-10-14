class Game
  def initialize(p1_name, p2_name, rounds)
    @player1 = Player.new(p1_name, "x")
    @player2 = Player.new(p2_name, "o")
    @rounds = rounds.to_i
  end

  # Runs the entire game
  def start
    welcome_screen
    @rounds.times do
      round = Round.new(@player1, @player2)
      round.play
      @player1.sign, @player2.sign = @player2.sign, @player1.sign
      @player1, @player2 = @player2, @player1
    end
    settle
    ending_screen
  end

  private
  # Settles the game by comparing players' scores
  def settle
    if @player1.score > @player2.score
      @game_winner = @player1
    elsif @player2.score > @player1.score
      @game_winner = @player2
    else
      @game_winner = nil
    end
  end

  # Prints a welcome screen indicating the game begins
  def welcome_screen
    puts "#{@rounds} rounds will be played."
  end

  # Ends the game by displaying the final result
  def ending_screen
    if @game_winner.nil?
      puts "DRAW!"
    else
      puts "#{@game_winner.name} has won the game by winning #{@game_winner.score} out of #{@rounds}"
    end
  end
end