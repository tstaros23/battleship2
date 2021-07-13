require "./lib/ship"
require "./lib/cell"

RSpec.describe Cell do
  it "exists" do
    cell = Cell.new("B4")

    expect(cell).to be_a(Cell)
  end

  it "has attributes" do
    cell = Cell.new("B4")

    expect(cell.coordinate).to eq("B4")
  end

  it "starts without a ship" do
    cell = Cell.new("B4")

    expect(cell.ship).to eq(nil)
  end

  it "assess if it has a ship" do
    cell = Cell.new("B4")

    expect(cell.empty?).to eq(true)
  end

  it "can have a ship placed" do
    cruiser = Ship.new("Cruiser", 3)
    cell = Cell.new("B4")

    cell.place_ship(cruiser)
    expect(cell.ship).to eq(cruiser)
    expect(cell.empty?).to eq(false)
  end

  it "can be fired upon" do
    cruiser = Ship.new("Cruiser", 3)
    cell = Cell.new("B4")

    cell.place_ship(cruiser)
    expect(cell.fired_upon?).to eq(false)
    cell.fire_upon
    expect(cell.ship.health).to eq(2)
    expect(cell.fired_upon?).to eq(true)
  end

  it "can render what has happened to the ship" do
    it 'can render if a cell has been missed' do
       cell_1 = Cell.new("B4")
       expect(cell_1.render).to eq(".")
       cell_1.fire_upon
       expect(cell_1.render).to eq("M")
  end
  it 'can render if the cell has a ship on it' do
       cell_2 = Cell.new("C3")
       cruiser = Ship.new("Cruiser", 3)
       cell_2.place_ship(cruiser)
       expect(cell_2.render(true)).to eq("S")
  end
  it 'can render a hit' do
       cell_2 = Cell.new("C3")
       cruiser = Ship.new("Cruiser", 3)
       cell_2.place_ship(cruiser)
       cell_2.fire_upon
       expect(cell_2.render).to eq("H")
       expect(cruiser.sunk?).to be false
  end
  it 'can render sunk' do
       cell_2 = Cell.new("C3")
       cruiser = Ship.new("Cruiser", 3)
       cell_2.place_ship(cruiser)
       cell_2.fire_upon
       cruiser.hit
       cruiser.hit
       expect(cruiser.sunk?).to be true
       expect(cell_2.render).to eq("X")
  end

  it 'can render if a cell has been missed' do
    cell_1 = Cell.new("B4")
    expect(cell_1.render).to eq(".")
    cell_1.fire_upon
    expect(cell_1.render).to eq("M")
  end

  it 'can render if the cell has a ship on it' do
    cell_2 = Cell.new("C3")
    cruiser = Ship.new("Cruiser", 3)
    cell_2.place_ship(cruiser)
    expect(cell_2.render).to eq(".")
    expect(cell_2.render(true)).to eq("S")
  end

  it 'can render a hit' do
    cell_2 = Cell.new("C3")
    cruiser = Ship.new("Cruiser", 3)
    cell_2.place_ship(cruiser)
    cell_2.fire_upon
    expect(cell_2.render).to eq("H")
    expect(cruiser.sunk?).to be false
  end

  it 'can render sunk' do
    cell_2 = Cell.new("C3")
    cruiser = Ship.new("Cruiser", 3)
    cell_2.place_ship(cruiser)
    cell_2.fire_upon
    cruiser.hit
    cruiser.hit
    expect(cruiser.sunk?).to be true
    expect(cell_2.render).to eq("X")
  end
end
