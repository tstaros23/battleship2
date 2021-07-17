require './lib/board'
require './lib/cell'
require './lib/ship'
require './lib/game'

class Game
  attr_reader :board

  def initialize
    @board = Board.new
  end

  def welcome
    "Welcome to BATTLESHIP \n" +
    "Enter p to play. Enter q to quit."
  end

  def start
    "HI"
  end

  def computer_place_ships
    require 'pry'; binding.pry
    # ships array as argument- cruiser, sub
    # iterate over somehow |ship|
    # randoize coordinates use valid_placement?
    #  computer_board.place(ship, coordinates)
  end

  def randomize_coordinates(ship_length)
    coordinate_array = board.cells.keys
    shuffled_array = coordinate_array.shuffle!()
    coordinates_to_check << shuffled_array.pop(ship_length)




  end

  def user_place_ships

  end

  def welcome_screen_input
    input = gets.chomp
    if input == "p"
      computer_place_ships
      user_place_ships
    elsif input == "q"
      system "clear"
    else
      puts "Not a valid input. \n" + welcome
    end
  end

  def run_game
    puts welcome
    print welcome_screen_input
  end
end
