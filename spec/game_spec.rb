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

    expect(game.user_ships.first.name).to eq("Cruiser")
    expect(game.user_ships.length).to eq(2)
  end

  it 'has a welcome message' do
    game = Game.new

    expect(game.welcome).to eq("Welcome to BATTLESHIP \n" +
    "Enter p to play. Enter q to quit.")
  end

  xit 'takes input on welcome screen' do
    game = Game.new

    #HOW DO WE TEST THIS????

  end

  it 'creates random coordinates' do
    game = Game.new

    expect(game.randomize_coordinates(2).length).to eq(2)
    expect(game.randomize_coordinates(2)[0].class).to eq(String)
  end

  xit 'places ships on computer board' do
    game = Game.new

    game.computer_place_ships

  end

  xit 'places players ship' do
    game = Game.new

    game.player_start


  end


  it "has computer select random valid coordinates" do
    game = Game.new

    expect(game.computer_place_ships).to eq("I have laid out my ships on the grid.")
  end
end
