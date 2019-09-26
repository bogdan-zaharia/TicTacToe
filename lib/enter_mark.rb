require '../lib/generate_ai_position'
#require 'generate_ai_position'

class EnterMark
  def initialize(gateway)
    @gateway = gateway
  end

  def execute(hash)
    values = @gateway.grid.marks
    if hash[:player]
      if values[hash[:position]] == ' '
        values[hash[:position]] = 'X'
        @gateway.save(values)
      else
       return :error
      end
    else
      values[hash[:position]] = 'O'
      @gateway.save(values)
    end
  end
end
