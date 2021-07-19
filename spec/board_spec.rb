require './lib/board'
require './lib/ship'

RSpec.describe Board do
  it 'exists' do
    board = Board.new

    expect(board).to be_a(Board)
  end

  it 'has cells' do
    board = Board.new

    expect(board.cells.class).to eq (Hash)
    expect(board.cells.keys.length).to eq(16)
    expect(board.cells["A1"]).to be_a(Cell)
  end

  it 'validates coordinates' do
    board = Board.new

    expect(board.valid_coordinate?("B4")).to eq(true)
    expect(board.valid_coordinate?("A23")).to eq(false)
  end

  it 'splits coordinates' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    expect(board.split_coordinates(["A2", "A3", "A4"])).to eq([["A", "2"], ["A", "3"], ["A", "4"]])
  end

  it 'organizes by index into seperate arrays' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    array_of_coordinates = board.split_coordinates(["A2", "A3", "A4"])

    expect(board.organize_letters_by_index(array_of_coordinates, 0)).to eq([65, 65, 65])
  end

  it 'can asesses if coordinates are consecutive' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    coordinate_letters = [65, 65, 65]
    coordinate_numbers = [1, 2, 3]

    expect(board.consecutive_items(coordinate_letters)).to eq(false)
    expect(board.consecutive_items(coordinate_numbers)).to eq(true)
  end

  it 'can tell if a cell is open' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)

    board.place(cruiser,["A1", "A2", "A3"])

    expect(board.cells_open?(["A1", "A2"])).to be false
    expect(board.cells_open?(["B1", "B2"])).to be true
  end

  it 'validates placement' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)


    expect(board.valid_placement?(cruiser, ["A1", "A2"])).to be false
    expect(board.valid_placement?(submarine, ["A2", "A3", "A4"])).to be false
    expect(board.valid_placement?(submarine, ["A2", "A3"])).to be true
    expect(board.valid_placement?(cruiser, ["A1", "A2", "A4"])).to be false
    expect(board.valid_placement?(submarine, ["A1", "C1"])).to be false
    expect(board.valid_placement?(cruiser, ["A3", "A2", "A1"])).to be false
    expect(board.valid_placement?(submarine, ["C1", "B1"])).to be false
    expect(board.valid_placement?(cruiser, ["A1", "B2", "C3"])).to be false
    expect(board.valid_placement?(submarine, ["A1", "A2"])).to be true
    expect(board.valid_placement?(cruiser, ["B1", "C1", "D1"])).to be true
  end

  it "places a ship" do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)

    board.place(cruiser,["A1", "A2", "A3"])

    cell_1 = board.cells["A1"]
    cell_2 = board.cells["A2"]
    cell_3 = board.cells["A3"]

    expect(cell_1.ship).to eq(cruiser)
    expect(cell_2.ship).to eq(cruiser)
    expect(cell_3.ship).to eq(cruiser)
    expect(cell_3.ship == cell_2.ship).to eq(true)
  end

  it "can render on the board" do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    
    board.place(cruiser,["A1", "A2", "A3"])

    expect(board.render).to eq("  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n")
    expect(board.render(true)).to eq("  1 2 3 4 \nA S S S . \nB . . . . \nC . . . . \nD . . . . \n")
  end
end
