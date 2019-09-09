require 'view_grid'
require 'grid'
require 'enter_mark'

class InMemoryGateway
  attr_accessor :grid
  def initialize(grid)
    @grid = grid
  end

  def save(input)
    # if input[:player]
    #   @marks.marks[input[:position]] = 'X'
    # end
  end

  def all
    @grid.marks
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

  it "can input a mark" do
    gateway = InMemoryGateway.new(Grid.new([' ',' ',' ',' ',' ',' ',' ',' ',' ']))
    EnterMark.new(gateway).execute({position: 5, player: true})
    grid = ViewGrid.new(gateway)
    expect(grid.execute({})).to eq({grid: "   |   |   \n-----------\n   |   | X \n-----------\n   |   |   \n"})
  end

end