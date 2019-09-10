describe PlayGame do
  it "can play a game" do
    game = PlayGame.new
    expect(game.execute).to eq("AI").or eq("Player").or eq("Draw")
  end

  it ""
end