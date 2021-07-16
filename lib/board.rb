require './cell'
class Board
  attr_reader :cells
  def initialize
    @cells = {
              "A1" => Cell.new("A1"),
              "A2" => Cell.new("A2"),
              "A3" => Cell.new("A3"),
              "A4" => Cell.new("A4"),
              "B1" => Cell.new("B1"),
              "B2" => Cell.new("B2"),
              "B3" => Cell.new("B3"),
              "B4" => Cell.new("B4"),
              "C1" => Cell.new("C1"),
              "C2" => Cell.new("C2"),
              "C3" => Cell.new("C3"),
              "C4" => Cell.new("C4"),
              "D1" => Cell.new("D1"),
              "D2" => Cell.new("D2"),
              "D3" => Cell.new("D3"),
              "D4" => Cell.new("D4")
            }
  end

  def add_cell(string)
    @cells[string] = Cell.new(string)
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

  def cells_open?(coordinates)
    coordinates.all? do |coordinate|
        @cells[coordinate].empty?
    end
  end

  def valid_placement?(ship, desired_coordinates)
    return false unless ship.length == desired_coordinates.length && cells_open?(desired_coordinates)
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

  def place(ship_to_place, coordinates)
    if valid_placement?(ship_to_place, coordinates)
      coordinates.each do |coordinate|
        @cells[coordinate].place_ship(ship_to_place)
      end
    else
      "Can not place ship here."
    end
  end
end
