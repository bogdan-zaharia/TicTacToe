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
      #gets_position_from_the_keyboard
      #while(values[hash[:position]] != ' ') do
        #puts('please enter a valid position')
        #gets_position_from_the_keyboard
        #hash[:position] = gets_position_from_the_keyboard
      #end
      if values[hash[:position]] == ' '
        values[hash[:position]] = 'X'
        @gateway.save(values)
      end
    else
      values[hash[:position]] = 'O'
      @gateway.save(values)
    end
  end
end