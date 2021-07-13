class Cell
  attr_reader :coordinate, :ship, :been_fired_upon
  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @been_fired_upon = false
  end

  def empty?
    @ship == nil
  end

  def place_ship(ship)
    @ship = ship
  end

  def fired_upon?
    @been_fired_upon
  end

  def fire_upon
    @been_fired_upon = true
    if @ship != nil
      @ship.hit
    end
  end

  def render(show_ship=false)
    if @been_fired_upon == false
      "."
    elsif @been_fired_upon == false && show_ship == true && @ship != nil
      "S"
    elsif @ship == nil && @been_fired_upon == true
      "M"
    



  end
end
