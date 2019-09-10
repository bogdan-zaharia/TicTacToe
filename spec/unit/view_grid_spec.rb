require 'grid'
require 'view_grid'

describe ViewGrid do

  class ViewGateway
    def initialize(grid)
      @grid = grid
    end

    def all
      @grid.marks #might need to change to @grid
    end
  end

  it "displays an empty grid at the beginning of the game" do
    gateway = ViewGateway.new(Grid.new([' ',' ',' ',' ',' ',' ',' ',' ',' ']))
    grid = ViewGrid.new(gateway)
    expect(grid.execute({})).to eq({grid: "   |   |   \n-----------\n   |   |   \n-----------\n   |   |   \n"})
  end

  it "displays a grid with marks on it" do
    gateway = ViewGateway.new(Grid.new([' ',' ',' ',' ','X',' ','O',' ','X']))
    grid = ViewGrid.new(gateway)
    expect(grid.execute({})).to eq({grid: "   |   |   \n-----------\n   | X |   \n-----------\n O |   | X \n"})
  end
end