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

  xit "can shuffle an array" do
    game = Game.new

    Array.any_instance.stub(:shuffled_array).and_return(["A1","A2","A3","A4" ,"B1" ,"B2" ,"B3" ,"B4" ,"C1", "C2" ,"C3" ,"C4" ,"D1" ,"D2" ,"D3" ,"D4"])
    a = Array.new
    expect(shuffled_array).to eq(["A1","A2","A3","A4" ,"B1" ,"B2" ,"B3" ,"B4" ,"C1", "C2" ,"C3" ,"C4" ,"D1" ,"D2" ,"D3" ,"D4"])
  end

  it 'puts player input on screen' do
    game = Game.new

    allow_any_instance_of(Game).to receive(:player_input).and_return("input")
    expect(game.player_input).to eq("input")

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


  xit "has computer select random valid coordinates" do
    game = Game.new

    expect(game.computer_place_ships).to eq("I have laid out my ships on the grid.")
  end

  it "has the computer take a shot" do
    game = Game.new
    game.computer_shot
  end

  it "can end the game" do

    game = Game.new
    game.end_game
  end
end
