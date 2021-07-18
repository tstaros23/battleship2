require './lib/board'
require './lib/cell'
require './lib/ship'
require './lib/game'

class Game
  attr_reader :board

  def initialize
    @user_board = Board.new
    @computer_board = Board.new
    @ships = the_ships
  end

  def welcome
    "Welcome to BATTLESHIP \n" +
    "Enter p to play. Enter q to quit."
  end

  def the_ships
    ships = []
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    ships << cruiser
    ships << submarine
  end

  def start
    computer_place_ships
  end

  def computer_place_ships
    @ships.each do |ship|
      require 'pry'; binding.pry
      placed = false
      until placed do
        coords = randomize_coordinates(ship.length)
        result = @computer_board.valid_placement?(ship, coords)
          placed = result
      end
    end
    print "I have laid out my ships on the grid."
  end

  def randomize_coordinates(ship_length)
    coordinate_array = @computer_board.cells.keys
    shuffled_array = coordinate_array.shuffle!
    shuffled_array.pop(ship_length)
  end


  def welcome_screen_input
    input = gets.chomp
    if input == "p"
      start
    elsif input == "q"
      exit
    else
      print "Not a valid input. "
      run_game
    end
  end

  def run_game
    puts welcome
    puts welcome_screen_input
  end
end
