describe PlayGame do
  it "can play a game" do
    game = PlayGame.new
    expect(game.execute).to eq("AI").or eq("Player").or eq("Draw")
  end

  xit "can check if the game isn't ended based on the empty grid" do
    game = PlayGame.new

  end
end