require '../lib/enter_mark'
require '../lib/tree'
require '../lib/minimax'
# require 'minimax'
# require 'enter_mark'
# require 'tree'
class GenerateAIPosition
  def initialize(gateway)
    @gateway = gateway
    @winning_combinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
  end

  def easy_mode
    if !@gateway.grid.marks.include?(' ')
      return -1
    end

    position = rand(0..8)
    while (@gateway.grid.marks[position] != ' ')
      position = rand(0..8)
    end
    return position
  end

  def normal_mode
    tree = Tree.to_tree(@gateway.all, false)
    position = Minimax.best_move(tree)
    position
  end

  def execute(hash)

    #easy_mode
    normal_mode
  end

end