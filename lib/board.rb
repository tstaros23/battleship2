require './lib/cell'
class Board
  attr_reader :cells
  def initialize
    @cells = cells_grid
  end

  def cells_grid
    ("A1".."D4").reduce(Hash.new) do |hash,string|
      number = string[-1].to_i
      if number > 0 && number < 5
        hash[string] = Cell.new(string)
      end
      hash
    end
      #(1..4).include?(number)
      #reduce creates a hash object in this case.
      #assigns it to local variable "hash" in this case
      #checks the string to see if the cell number is 1 through 4
      #if it is, it will add the cell to the hash
      #reduce returns the last line executed
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
      if valid_coordinate?(coordinate)
        @cells[coordinate].empty?
      end
    end
  end

  def valid_placement?(ship, desired_coordinates)
    return false unless ship.length == desired_coordinates.length && cells_open?(desired_coordinates)
    split = split_coordinates(desired_coordinates)
    coordinate_numbers = organize_numbers_by_index(split, 1)
    coordinate_letters = organize_letters_by_index(split, 0)
    vertical_check = consecutive_items(coordinate_letters) && coordinate_numbers.uniq.length == 1
    horizontal_check = coordinate_letters.uniq.length == 1 && consecutive_items(coordinate_numbers)
    vertical_check || horizontal_check
  end

  def place(ship_to_place, coordinates)
    if valid_placement?(ship_to_place, coordinates)
      coordinates.each do |coordinate|
        @cells[coordinate].place_ship(ship_to_place)
      end
    else
      puts "Can not place ship here."
    end
  end

  def render(value = false)
    string = "  1 2 3 4 \n"
    @cells.values.each_with_index do |cell, index|
      row = ""
      row = "A " if index == 0
      row = "\nB " if index == 4
      row = "\nC " if index == 8
      row = "\nD " if index == 12
      string += row + cell.render(value) + " "
    end
      string + "\n"
  end
end
