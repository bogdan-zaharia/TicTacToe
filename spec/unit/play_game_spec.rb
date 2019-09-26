describe PlayGame do

  it "can print out the outcome of the game on the screen" do
    game = PlayGame.new
    #expect { game.execute }.to output.to_stdout
    expect { game.display_winner(:draw) }.to output("DRAW!\n").to_stdout
    expect { game.display_winner(:aiwins) }.to output("AI WINS!\n").to_stdout
    expect { game.display_winner(:playerwins) }.to output("PLAYER WINS!\n").to_stdout
  end

  it "can check when the game has ended" do
    game = PlayGame.new
    gateway = InMemoryGateway.new(Grid.new(['X','X','X','O','O',' ',' ',' ',' ']))
    expect(game.game_end?(gateway)).to eq(true)
  end

  it "can check when the game hasn't ended" do
    game = PlayGame.new
    gateway = InMemoryGateway.new(Grid.new(['X','X',' ','O','O',' ',' ',' ',' ']))
    expect(game.game_end?(gateway)).to eq(false)
  end

  it "can check when the game has ended" do
    game = PlayGame.new
    gateway = InMemoryGateway.new(Grid.new(['O',' ','X',' ','O',' ',' ',' ','O']))
    expect(game.game_end?(gateway)).to eq(true)
  end

  it "can decide the outcome of the game" do
    game = PlayGame.new

    gateway = InMemoryGateway.new(Grid.new(['X','O','X','O','O','X','X','X','O']))
    expect(game.outcome(gateway)).to eq(:draw)

    gateway = InMemoryGateway.new(Grid.new(['O',' ','X',' ','O',' ',' ',' ','O']))
    expect(game.outcome(gateway)).to eq(:aiwins)

    gateway = InMemoryGateway.new(Grid.new(['O','O','X','O',' ',' ','X','X','X']))
    expect(game.outcome(gateway)).to eq(:playerwins)

  end

end