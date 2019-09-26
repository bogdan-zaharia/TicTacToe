describe GenerateAIPosition do
  it "can generate a random position" do
    gateway = InMemoryGateway.new(Grid.new([' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']))
    position = GenerateAIPosition.new(gateway).execute({})
    expect((0..8).include?(position)).to eq(true)
  end

  xit "can generate a random position" do
    gateway = InMemoryGateway.new(Grid.new(['X', 'O', 'O', 'X', 'X', 'O', 'X', ' ', 'X']))
    position = GenerateAIPosition.new(gateway).execute({})
    expect(position).to eq(7)
  end

  it "checks if the AI is able to block the player from winning (normal mode) [0, 1, 2]" do
    gateway = InMemoryGateway.new(Grid.new(['X', 'X', ' ', ' ', ' ', ' ', ' ', ' ', 'O']))
    position = GenerateAIPosition.new(gateway).execute({})
    expect(position).to eq(2)
  end

  it "checks if the AI is able to block the player from winning by placing 'O' in the middle (normal mode) [0, 1, 2]" do
    gateway = InMemoryGateway.new(Grid.new(['X', ' ', 'X', ' ', ' ', ' ', ' ', ' ', 'O']))
    position = GenerateAIPosition.new(gateway).execute({})
    expect(position).to eq(1)
  end

  it "checks if the AI is able to block the player from winning (normal mode) [3, 4, 5]" do
    gateway = InMemoryGateway.new(Grid.new([' ', ' ', ' ', 'X', 'X', ' ', ' ', ' ', 'O']))
    position = GenerateAIPosition.new(gateway).execute({})
    expect(position).to eq(5)
  end

  it "checks if the AI is able to block the player from winning (normal mode) [6, 7, 8]" do
    gateway = InMemoryGateway.new(Grid.new([' ', 'O', ' ', ' ', ' ', ' ', 'X', ' ', 'X']))
    position = GenerateAIPosition.new(gateway).execute({})
    expect(position).to eq(7)
  end

  it "checks if the AI is able to block the player from winning (normal mode) [0, 3, 6]" do
    gateway = InMemoryGateway.new(Grid.new(['X', ' ', ' ', ' ', 'O', ' ', 'X', ' ', ' ']))
    position = GenerateAIPosition.new(gateway).execute({})
    expect(position).to eq(3)
  end

  it "checks if the AI is able to block the player from winning (normal mode) [1, 4, 7]" do
    gateway = InMemoryGateway.new(Grid.new([' ', 'X', ' ', ' ', 'X', ' ', 'O', ' ', ' ']))
    position = GenerateAIPosition.new(gateway).execute({})
    expect(position).to eq(7)
  end

  it "checks if the AI is able to block the player from winning (normal mode) [2, 5, 8]" do
    gateway = InMemoryGateway.new(Grid.new(['O', ' ', ' ', ' ', ' ', 'X', ' ', ' ', 'X']))
    position = GenerateAIPosition.new(gateway).execute({})
    expect(position).to eq(2)
  end

  it "checks if the AI is able to block the player from winning (normal mode) [0, 4, 8]" do
    gateway = InMemoryGateway.new(Grid.new(['X', 'O', ' ', ' ', 'X', ' ', ' ', ' ', ' ']))
    position = GenerateAIPosition.new(gateway).execute({})
    expect(position).to eq(8)
  end

  it "checks if the AI is able to block the player from winning (normal mode) [2, 4, 6]" do
    gateway = InMemoryGateway.new(Grid.new(['O', ' ', 'X', ' ', ' ', ' ', 'X', ' ', ' ']))
    position = GenerateAIPosition.new(gateway).execute({})
    expect(position).to eq(4)
  end
end