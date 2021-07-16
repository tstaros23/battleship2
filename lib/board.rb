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

  def split_coordinates(coordinates_array)
    coordinates_array.map do |coordinate|
      coordinate.split("")
    end
  end


  def organize_numbers_by_index(split_coordinates, index)
    split_coordinates.map do |coordinate|
      coordinate[index].to_i
    end
  end

  def organize_letters_by_index(split_coordinates, index)
    split_coordinates.map do |coordinate|
      coordinate[index].ord.to_i
    end
  end

  def consecutive_items(coordinate_array)
    coordinate_array.each_cons(2).all? { |x, y| y == x + 1 }
  end

  def valid_placement?(ship, desired_coordinates)
    return false unless ship.length == desired_coordinates.length
    split_coordinates =  split_coordinates(desired_coordinates)
    coordinate_numbers = organize_numbers_by_index(split_coordinates, 1)
    coordinate_letters = organize_letters_by_index(split_coordinates, 0)
    consecutive_numbers = consecutive_items(coordinate_numbers)
    consecutive_letters = consecutive_items(coordinate_letters)
    if consecutive_letters && coordinate_numbers.uniq.length == 1
      true
    elsif coordinate_letters.uniq.length == 1 && consecutive_numbers
      true
    else
      false
    end
  end

  def place(ship, coordinate)
    if valid_placement(ship, coordinates)
      coordinates.each do |coordinate|
        cells[coordinate].ship = ship
      end
    else
      "Can not place ship here."
    end
  end
end
