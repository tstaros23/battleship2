class Board
  attr_reader :cells
  def initialize
    @cells = Hash.new(0)
  end

  def add_cell(cell)
    @cells[cell] = Cell.new(cell)
  end

  def valid_coordinate?(cell)
    @cells.include?(cell)
  end
end
