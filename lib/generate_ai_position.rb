class GenerateAIPosition
  def initialize(gateway)
    @gateway = gateway
  end

  def execute(hash)
    if !@gateway.grid.marks.include?(' ')
      return -1
    end
    x = rand(0..8)
    while (@gateway.grid.marks[x] != ' ')
      x = rand(0..8)
    end
    return x
  end

end