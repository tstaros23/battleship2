require './lib/board'
require './lib/cell'
require './lib/ship'

class Game
  attr_reader :user_board, :computer_board, :user_ships, :computer_ships

  def initialize
    @user_board = Board.new
    @computer_board = Board.new
    @user_ships = the_ships
    @computer_ships = the_ships
  end

  def the_ships
    [Ship.new("Cruiser", 3), Ship.new("Submarine", 2)]
  end

  def run_game
    puts welcome
    puts welcome_screen_input
  end

  def welcome
    "Welcome to BATTLESHIP \n" +
    "Enter p to play. Enter q to quit."
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

  def start
    computer_place_ships
    player_start
  end

  def randomize_coordinates(ship_length)
    coordinate_array = @computer_board.cells.keys
    shuffled_array = coordinate_array.shuffle!
    shuffled_array.pop(ship_length)
  end

  def computer_place_ships
    @computer_ships.each do |ship|
      placed = false
      until placed do
        coords = randomize_coordinates(ship.length)
        result = @computer_board.valid_placement?(ship, coords)
          placed = result
      end
      @computer_board.place(ship, coords)
    end
    puts "I have laid out my ships on the grid."
  end

  def player_start
    puts "You now need to lay out your two ships.\nThe Cruiser is three units long and the Submarine is two units long."
    puts @user_board.render
    user_place_ships
  end

  def get_user_input(ship)
    puts "Enter the squares for the #{ship.name} (#{ship.length} spaces):"
    input = gets.chomp
    input.upcase.to_s.split(" ")
  end

  def player_shot
    puts "Enter the coordinate for your shot:"

    valid = false
      until valid do

        user_input = gets.chomp.upcase.to_s
        keys = @user_board.cells.keys
        match = keys.any? do |key|
          key == user_input
        end

        valid = match
        valid
        puts "Try again"
      end
    puts "yes"
  end
  
  def user_place_ships
    @user_ships.each do |ship|
      placed = false
      until placed do
        coordinates = get_user_input(ship)
        result = @user_board.valid_placement?(ship, coordinates)
          placed = result
          puts "Those are invalid coordinates. Please try again:" if placed == false
      end
      @user_board.place(ship, coordinates)
    end
    puts "Your ships have been placed."
  end
end
