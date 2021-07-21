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


  it 'puts player input on screen' do
    game = Game.new

    allow_any_instance_of(Game).to receive(:player_input).and_return("input")
    expect(game.player_input).to eq("input")

  end

  it 'creates random coordinates' do
    game = Game.new
    allow(game).to receive(:randomize_coordinates).and_return(["A1", "A2"])
    expect(game.randomize_coordinates(2).length).to eq(2)
    expect(game.randomize_coordinates(2)[0].class).to eq(String)
    expect(game.randomize_coordinates(2)).to eq(["A1", "A2"])
  end

end
