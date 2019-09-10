describe EnterMark do

  # class Spy
  #   attr_accessor :grid
  #   def initialize(grid)
  #     @grid = grid
  #   end
  #
  #   def save(input)
  #     @grid.marks = input
  #   end
  #
  #   def last_input
  #     @grid.marks
  #   end
  # end

  it "allows the user to input a mark in the grid" do
    spy = InMemoryGateway.new(Grid.new([' ',' ',' ',' ',' ',' ',' ',' ',' ']))
    enter_mark = EnterMark.new(spy)
    enter_mark.execute({position: 4, player: true})
    expect(spy.all).to eq([' ',' ',' ',' ','X',' ',' ',' ',' '])
  end

  it "can input a 'O'" do
    spy = InMemoryGateway.new(Grid.new([' ',' ',' ',' ',' ',' ',' ',' ','X']))
    enter_mark = EnterMark.new(spy)
    enter_mark.execute({position: 1, player: false})
    expect(spy.all).to eq([' ','O',' ',' ',' ',' ',' ',' ','X'])
  end
end