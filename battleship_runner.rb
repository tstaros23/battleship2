require './lib/board'
require './lib/cell'
require './lib/ship'
require './lib/game'

user_board = Board.new
computer_board = Board.new
cruiser = Ship.new("Cruiser", 3)
submarine = Ship.new("Submarine", 2)
game = Game.new

game.run_game
