require './lib/board'
require './lib/cell'

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

  it 'validate placement' do
  board = Board.new
  cruiser = Ship.new("Cruiser", 3)
  submarine = Ship.new("Submarine", 2)

  expect(valid)



end
