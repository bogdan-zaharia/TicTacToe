class GenerateAIPosition
  def initialize(gateway)
    @gateway = gateway
    @winning_combinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
  end

  def execute(hash)
    if !@gateway.grid.marks.include?(' ')
      return -1
    end

    #second_position = check(position)

    # @winning_combinations.each do |combination|
    #   risk = 0
    #   risk += 1 if @gateway.grid.marks[combination[0]] == 'X'
    #   risk += 1 if @gateway.grid.marks[combination[1]] == 'X'
    #   risk += 1 if @gateway.grid.marks[combination[2]] == 'X'
    #   if risk == 2
    #     return combination[0] = ' '
    #   end
    #end

    x = rand(0..8)
    while (@gateway.grid.marks[x] != ' ')
      x = rand(0..8)
    end
    return x
  end

end