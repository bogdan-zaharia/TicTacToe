class EnterMark
  def initialize(gateway)
    @gateway = gateway
  end

  def execute(hash)
    if hash[:player]
      # values = ['', '']
      # values[hash:position] = 'X'
      # @gateway.save(Grid.new(values))values
      @gateway.grid.marks[hash[:position]] = 'X'
    end
#    @gateway.save()
  end
end