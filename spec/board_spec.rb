require './lib/board'
require './lib/ship'

RSpec.describe Board do
  it 'exists' do
    board = Board.new

    expect(board).to be_a(Board)
  end

  # it 'has cells' do
  #   board = Board.new
  #   cell_1 = Cell.new("B4")
  #   cell_2 = Cell.new("B5")
  #   board.add_cell("B5")
  #   board.add_cell("B4")
  #
  #   expect(board.cells).to eq({})
  # end
  it 'validates coordinates' do
    board = Board.new
    cell_1 = Cell.new("B4")
    board.add_cell("B4")

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
      # require "pry"; binding.pry
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      board.add_cell("A1")
      board.add_cell("A2")
      board.add_cell("A3")

      board.place(cruiser,["A1", "A2", "A3"])

      cell_1 = board.cells["A1"]
      cell_2 = board.cells["A2"]
      cell_3 = board.cells["A3"]

      # require "pry"; binding.pry
      expect(cell_1.ship).to eq(cruiser)
      expect(cell_2.ship).to eq(cruiser)
      expect(cell_3.ship).to eq(cruiser)
      expect(cell_3.ship == cell_2.ship).to eq(true)

    end
end
