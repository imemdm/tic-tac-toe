require "./Round.rb"
require "./Player.rb"

class Game
  def initialize(p1_name, p2_name, rounds)
    @player1 = Player.new(p1_name, "x")
    @player2 = Player.new(p2_name, "o")
    @rounds = rounds.to_i
  end


  def start
    welcome_screen
    @rounds.times do
      round = Round.new(@player1, @player2)
      round.play
      @player1.sign, @player2.sign = @player2.sign, @player1.sign
      @player1, @player2 = @player2, @player1
    end
  end


  # Prints a welcome screen indicating the game begins
  def welcome_screen
    puts "#{@rounds} rounds will be played."
  end
end