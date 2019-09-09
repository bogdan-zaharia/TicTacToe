describe EnterMark do

  class Spy
    attr_accessor :grid
    def initialize(grid)
      @grid = grid
    end

    def save(input)
      # if input[:player]
      #   @marks.marks[input[:position]] = 'X'
      # end
    end

    def last_input
      @grid.marks
    end
  end

  it "allows the user to input a mark in the grid" do
    spy = Spy.new(Grid.new([' ',' ',' ',' ',' ',' ',' ',' ',' ']))
    enter_mark = EnterMark.new(spy)
    enter_mark.execute({position: 4, player: true})
    expect(spy.last_input).to eq([' ',' ',' ',' ','X',' ',' ',' ',' '])
  end
end