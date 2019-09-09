require 'view_grid'
require 'grid'

class InMemoryGateway
  def initialize(marks)
    @marks = marks
  end
  def all
    @marks
  end
end



describe 'tic tac toe' do
  it "displays an empty grid at the beginning of the game" do
    gateway = InMemoryGateway.new(Grid.new([' ',' ',' ',' ',' ',' ',' ',' ',' ']))
    grid = ViewGrid.new(gateway)
    expect(grid.execute({})).to eq({grid: "   |   |   \n-----------\n   |   |   \n-----------\n   |   |   \n"})
  end

  it "displays a grid with marks on it" do
    gateway = InMemoryGateway.new(Grid.new([' ',' ',' ',' ','X',' ','O',' ','X']))
    grid = ViewGrid.new(gateway)
    expect(grid.execute({})).to eq({grid: "   |   |   \n-----------\n   | X |   \n-----------\n O |   | X \n"})
  end
end