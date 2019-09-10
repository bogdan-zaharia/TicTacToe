require '../lib/enter_mark'
require '../lib/grid'
require '../lib/in_memory_gateway'
require '../lib/view_grid'
# require 'enter_mark'
# require 'grid'


class PlayGame
  attr_accessor :gateway
  def initialize
    @gateway = InMemoryGateway.new(Grid.new([' ',' ',' ',' ',' ',' ',' ',' ',' ']))
  end

  def game_end?
    !@gateway.grid.marks.include?(' ')
  end

  def execute
    enter_mark = EnterMark.new(@gateway)
    ViewGrid.new(@gateway).show
    while !game_end?
      enter_mark.execute({player: true})
      ViewGrid.new(@gateway).show
      enter_mark.execute({player: false})
      ViewGrid.new(@gateway).show
    end
    return game_outcome
  end
end