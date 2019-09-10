require '../lib/generate_ai_position'

class EnterMark
  def initialize(gateway)
    @gateway = gateway
  end

  # def gets_position_from_the_keyboard
  #   p = read position from keyboard
  #   values[hash[:position]] = p
  # end



  def execute(hash)

    values = @gateway.grid.marks
    if hash[:player]
      puts "Player's turn"
      position = gets().chomp.to_i
      if values[position] == ' '
        values[position] = 'X'
        @gateway.save(values)
      else
        puts 'Please choose a different position'
        self.execute({player: true})
      end
    else
      puts "AI turn"
      position = GenerateAIPosition.new(@gateway).execute({})
      values[position] = 'O'
      @gateway.save(values)
    end
  end
end



#gets_position_from_the_keyboard
#while(values[hash[:position]] != ' ') do
#puts('please enter a valid position')
#gets_position_from_the_keyboard
#hash[:position] = gets_position_from_the_keyboard
#end