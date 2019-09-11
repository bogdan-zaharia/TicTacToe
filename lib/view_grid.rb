class ViewGrid
  def initialize(gateway)
    @gateway = gateway
  end

  def show
    a = self.execute({})
    puts a[:grid]
  end

  def execute(hash)
    m = @gateway.all
    {grid: " #{m[0]} | #{m[1]} | #{m[2]} \n-----------\n #{m[3]} | #{m[4]} | #{m[5]} \n-----------\n #{m[6]} | #{m[7]} | #{m[8]} \n"}
  end
end