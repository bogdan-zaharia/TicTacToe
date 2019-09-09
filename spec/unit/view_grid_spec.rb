require 'grid'
require 'view_grid'

describe ViewGrid do

  class ViewGateway
    def initialize(marks)
      @marks = marks
    end

    def all
      @marks
    end
  end

  it "displays an empty grid at the beginning of the game" do
    grid = ViewGrid.new(Grid.new([' ',' ',' ',' ',' ',' ',' ',' ',' ']))
    expect(grid.execute({})).to eq({grid: "   |   |   \n-----------\n   |   |   \n-----------\n   |   |   \n"})
  end

  it "displays a grid with marks on it" do
    gateway = ViewGateway.new(Grid.new([' ',' ',' ',' ','X',' ','O',' ','X']))
    grid = ViewGrid.new(gateway)
    expect(grid.execute({})).to eq({grid: "   |   |   \n-----------\n   | X |   \n-----------\n O |   | X \n"})
  end
end