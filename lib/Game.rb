class Game
  def self.start
    print "Please select a name for Player 1: "
    player1 = gets.chomp

    print "Please select a name for Player 2: "
    player2 = gets.chomp

    print "How many round do you wanna play: "
    rounds = gets.chomp

    puts "Game is about to start. Mark a tile by choosing a number between 1 and 9."

    Game.new(player1, player2, rounds).run
  end

  def initialize(p1_name, p2_name, rounds)
    @player1 = Player.new(p1_name, "x")
    @player2 = Player.new(p2_name, "o")
    @rounds = rounds.to_i
    @players = [player1, player2]
  end

  # Runs the entire game
  def run
    welcome_screen
    rounds.times do
      round = Round.new(first, second)
      round.play
      flip_players
    end
    settle
    ending_screen
  end

  private

  attr_accessor :player1, :player2, :rounds

  def flip_players
    if first.equal?(player1)
      self.first = player2
      self.second = player1
    else
      self.first = player1
      self.second = player2
    end
  end

  # Compares the scores of both players
  def settle
    puts "DRAW" if player1.score == player2.score
    winner = [player1, player2].sort_by { |player| player.score }.last
    show_winner(winner)
  end

  # Displays the details of the winning player
  def show_winner(game_winner)
    puts "#{game_winner.name} has won the game by winning #{game_winner.score} out of #{rounds}"
  end
end