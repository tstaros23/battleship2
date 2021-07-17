require './lib/board'
require './lib/cell'
require './lib/ship'
require './lib/game'

class Game
  def welcome
    puts "Welcome to BATTLESHIP \n" +
    "Enter p to play. Enter q to quit."
    user_input
    if user_input == "p"
    elsif user_input == "q"
      system "clear"
    else
      welcome
    end
  end

  def user_input
    gets.chomp
  end

  def start


  end

  def run_game
    welcome
  end
end
