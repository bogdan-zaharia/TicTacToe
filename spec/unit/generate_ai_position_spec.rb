describe GenerateAIPosition do
  it "can generate a random position" do
    gateway = InMemoryGateway.new(Grid.new([' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']))
    position = GenerateAIPosition.new(gateway).execute({})
    expect((0..8).include?(position)).to eq(true)
  end

  it "can generate a random position" do
    gateway = InMemoryGateway.new(Grid.new(['X', 'O', 'O', 'X', 'X', 'O', 'X', ' ', 'X']))
    position = GenerateAIPosition.new(gateway).execute({})
    expect(position).to eq(7)
  end
end