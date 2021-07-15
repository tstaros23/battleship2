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

  def valid_placement?(ship, desired_coordinates)
    split_coordinates = desired_coordinates.map do |coordinate|
      coordinate.split("")
    end
    coordinate_letters = split_coordinates.map do |coordinate|
      coordinate[0].ord.to_i
    end
    coordinate_numbers = split_coordinates.map do |coordinate|
      coordinate[1].to_i
    end
    consecutive_letters = coordinate_letters.each_cons(2).all? { |x, y| y == x + 1 }
    consecutive_numbers = coordinate_numbers.each_cons(2).all? { |x, y| y == x + 1 }

    valid_length = ship.length == desired_coordinates.length

    if valid_length != true
      false
    elsif consecutive_letters && coordinate_numbers.uniq.length == 1
      true
    elsif coordinate_letters.uniq.length == 1 && consecutive_numbers
      true
    else
      false
    end
  end
end
