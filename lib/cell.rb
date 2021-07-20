class Cell
  attr_reader :coordinate, :ship
  def initialize(coordinate)
    @coordinate = coordinate
    @been_fired_upon = false
  end

  def empty?
    @ship.nil?
  end

  def place_ship(ship)
    @ship = ship
  end

  def fired_upon?
    @been_fired_upon
  end

  def fire_upon
    @been_fired_upon = true
    if !empty?
      @ship.hit
    end
  end

  def render(show_ship = false)
    if !fired_upon? && show_ship && !empty?
      "S"
    elsif fired_upon? && !empty? && @ship.sunk?
      "X"
    elsif empty? && fired_upon?
      "M"
    elsif fired_upon? && !empty?
      "H"
    else
      "."
    end
  end
end
