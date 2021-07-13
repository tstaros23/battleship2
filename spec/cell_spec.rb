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
end
