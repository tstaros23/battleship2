require './lib/board'
require './lib/cell'

RSpec.describe Board do
  it 'exists' do
    board = Board.new

    expect(board).to be_a(Board)
  end

  it 'has cells' do
    board = Board.new
    cell = Cell.new("B4")
    cell = Cell.new("B5")
    board.add_cell("B5")
    board.add_cell("B4")

    expect(board.cells).to eq("asdfsdf")
  end


    # expect(board.cells).to eq

end
