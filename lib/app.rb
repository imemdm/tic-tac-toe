require './lib/Game.rb'
require './lib/Board.rb'
require './lib/Round.rb'
require './lib/Player.rb'

print "Please select a name for Player 1: "
player1 = gets.chomp

print "Please select a name for Player 2: "
player2 = gets.chomp

print "How many round do you wanna play: "
rounds = gets.chomp

puts "Game is about to start. Mark a tile by choosing a number between 1 and 9."

game = Game.new(player1, player2, rounds)
game.start