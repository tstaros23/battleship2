require './lib/board'
require './lib/cell'
require './lib/ship'
require './lib/game'

RSpec.describe Game do
  it "exists" do
    game = Game.new

    expect(game).to be_a(Game)
  end

  # it "has a welcome message" do
  #   game = Game.new
  #   # require "pry"; binding.pry
  #   expect(game.welcome).to eq("Welcome to BATTLESHIP \n" +
  #   "Enter p to play. Enter q to quit.")

  it "has computer select random valid coordinates" do
    game = Game.new
    board= Board.new


  expect(game.computer_place_ships).to eq()

  end
end
