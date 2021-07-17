require './lib/board'
require './lib/cell'
require './lib/ship'
require './lib/game'

class Game
  def welcome
    "Welcome to BATTLESHIP \n" +
    "Enter p to play. Enter q to quit."
  end

  def start
    "HI"
  end

  def welcome_screen_input
    input = gets.chomp
    if input == "p"
      puts start
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
