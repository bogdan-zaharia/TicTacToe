require '../lib/enter_mark'
require '../lib/grid'
require '../lib/in_memory_gateway'
require '../lib/view_grid'
# require 'enter_mark'
# require 'grid'
# require 'view_grid'


class PlayGame
  attr_accessor :gateway
  def initialize
    @gateway = InMemoryGateway.new(Grid.new([' ',' ',' ',' ',' ',' ',' ',' ',' ']))
    @winning_combinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
  end

  def read_correct_input
    input = gets().chomp
    while !(('0'..'8').include?(input) && !('!'..'/').include?(input) && !(":".."~").include?(input))
      puts 'Please choose a different position'
      input = gets().chomp
    end
      return input.to_i
  end

  def game_end?(gateway)
    condition1 = false
    @winning_combinations.each do |i|
      if (gateway.grid.marks[i[0]] == gateway.grid.marks[i[1]] && gateway.grid.marks[i[1]] == gateway.grid.marks[i[2]] && gateway.grid.marks[i[2]] != ' ')
        condition1 = true
      end
    end
    condition2 = !gateway.grid.marks.include?(' ')
    condition1 || condition2
  end

  def display_winner(game_outcome)
    if game_outcome == :draw
      puts("DRAW!")
    elsif game_outcome == :aiwins
      puts("AI WINS!")
    else
      puts("PLAYER WINS!")
    end
  end

  def outcome(gateway)
    marks = gateway.grid.marks
      if game_end?(gateway) && !marks.include?(' ')
        return :draw
      elsif marks.count('X') > marks.count('O')
        return :playerwins
      end
    return :aiwins
  end

  def execute
    enter_mark = EnterMark.new(@gateway)
    ViewGrid.new(@gateway).show

    while !game_end?(@gateway)
      puts "Player's turn"
      position = read_correct_input
      result = enter_mark.execute({position: position, player: true})
      while result == :error
        puts "Please choose a different position"
        position = read_correct_input
        result = enter_mark.execute({position: position, player: true})
      end
      ViewGrid.new(@gateway).show
      if !game_end?(@gateway)
        puts "AI turn"
        position = GenerateAIPosition.new(@gateway).execute({})
        enter_mark.execute({position: position, player: false})
        ViewGrid.new(@gateway).show
      end
    end
    game_outcome = outcome(@gateway)
    #puts (game_outcome.to_s.upcase.gsub(/W/, " W")) + '!'
    display_winner(game_outcome)
  end
end