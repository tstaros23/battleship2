require './lib/board'
require './lib/cell'
require './lib/ship'
require './lib/game'

RSpec.describe Game do
  it 'exists' do
    game = Game.new

    expect(game).to be_a(Game)
  end

  it 'has two boards' do
    game = Game.new

    expect(game.user_board).to be_a(Board)
    expect(game.computer_board).to be_a(Board)
  end

  it 'has a cruiser and a submarine' do
    game = Game.new

    expect(game.ships[0].name).to eq("Cruiser")
    expect(game.ships[1].name).to eq("Submarine")
    expect(game.ships.length).to eq(2)
  end

  it 'has a welcome message' do
    game = Game.new

    expect(game.welcome).to eq("Welcome to BATTLESHIP \n" +
    "Enter p to play. Enter q to quit.")
  end

  # it 'takes input on welcome screen' do
  #   game = Game.new
  #
  #   #HOW DO WE TEST THIS????
  #
  # end

  it 'creates random coordinates' do
  
    # expect(game.randomize_coordinates(2).length).to eq(2)
    # expect(game.randomize_coordinates(2)[0].class).to eq(String)
  end

  # it 'places ships on computer board' do
  #   game = Game.new
  #
  #   allow(game).to receive()
  #   expect(game.computer_place_ships).to eq(true)

    #how to test this when coordinates are random

  # end

  it "has computer select random valid coordinates" do
    game = Game.new
    board= Board.new

    expect(game.computer_place_ships).to eq("I have laid out my ships on the grid.")
  end

  it "can ask a player to take a shot" do
    game = Game.new

    expect(game.player_shot(["A1"])).to eq("My shot on A1 was a miss")
  end
end
