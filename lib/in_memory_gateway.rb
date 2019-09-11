class InMemoryGateway
  attr_accessor :grid
  def initialize(grid)
    @grid = grid
  end

  def save(input)
    @grid.marks = input # array, not object
  end

  def all
    @grid.marks
  end
end