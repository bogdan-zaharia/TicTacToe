require 'view_grid'
require 'grid'
require 'enter_mark'
require 'generate_ai_position'
require 'play_game'

class InMemoryGateway
  attr_accessor :grid
  def initialize(grid)
    @grid = grid
  end

  def save(input)
    @grid.marks = input
  end

  def all
    @grid.marks
  end
end



describe 'tic tac toe' do
  it "displays an empty grid at the beginning of the game" do
    gateway = InMemoryGateway.new(Grid.new([' ',' ',' ',' ',' ',' ',' ',' ',' ']))
    grid = ViewGrid.new(gateway)
    expect(grid.execute({})).to eq({grid: "   |   |   \n-----------\n   |   |   \n-----------\n   |   |   \n"})
  end

  it "displays a grid with marks on it" do
    gateway = InMemoryGateway.new(Grid.new([' ',' ',' ',' ','X',' ','O',' ','X']))
    grid = ViewGrid.new(gateway)
    expect(grid.execute({})).to eq({grid: "   |   |   \n-----------\n   | X |   \n-----------\n O |   | X \n"})
  end

  it "can input an 'X' mark" do
    gateway = InMemoryGateway.new(Grid.new([' ',' ',' ',' ',' ',' ',' ',' ',' ']))
    EnterMark.new(gateway).execute({position: 5, player: true})
    grid = ViewGrid.new(gateway)
    expect(grid.execute({})).to eq({grid: "   |   |   \n-----------\n   |   | X \n-----------\n   |   |   \n"})
  end

it "can input an 'X' into a partly populated grid" do
    gateway = InMemoryGateway.new(Grid.new(['X',' ',' ',' ',' ',' ',' ',' ','X']))
    EnterMark.new(gateway).execute({position: 5, player: true})
    grid = ViewGrid.new(gateway)
    expect(grid.execute({})).to eq({grid: " X |   |   \n-----------\n   |   | X \n-----------\n   |   | X \n"})
  end

  it "can't input a different mark in an occupied space'" do
    gateway = InMemoryGateway.new(Grid.new(['O',' ',' ',' ',' ',' ',' ',' ','X']))
    EnterMark.new(gateway).execute({position: 0, player: true})
    grid = ViewGrid.new(gateway)
    expect(grid.execute({})).to eq({grid: " O |   |   \n-----------\n   |   |   \n-----------\n   |   | X \n"})
  end

  it "can't input a same mark in an occupied space" do
    gateway = InMemoryGateway.new(Grid.new(['X',' ',' ',' ',' ',' ',' ',' ','X']))
    EnterMark.new(gateway).execute({position: 0, player: true})
    grid = ViewGrid.new(gateway)
    expect(grid.execute({})).to eq({grid: " X |   |   \n-----------\n   |   |   \n-----------\n   |   | X \n"})
  end

  it "can input a 'O'" do
    gateway = InMemoryGateway.new(Grid.new([' ',' ',' ',' ',' ',' ',' ',' ','X']))
    EnterMark.new(gateway).execute({position: 0, player: false})
    grid = ViewGrid.new(gateway)
    expect(grid.execute({})).to eq({grid: " O |   |   \n-----------\n   |   |   \n-----------\n   |   | X \n"})
  end

  it "allows the AI to generate a position for its mark" do
    gateway = InMemoryGateway.new(Grid.new([' ',' ',' ',' ',' ',' ',' ',' ',' ']))
    position_AI = GenerateAIPosition.new(gateway).execute({})
    EnterMark.new(gateway).execute({position: position_AI, player: false})
    grid = ViewGrid.new(gateway)
    expect(grid.execute({})).to_not eq({grid: "   |   |   \n-----------\n   |   |   \n-----------\n   |   |   \n"})
  end

  it "allows the AI to generate a position for its mark" do
    gateway = InMemoryGateway.new(Grid.new(['X','X','X','X','X','X','X','X',' ']))
    position_AI = GenerateAIPosition.new(gateway).execute({})
    EnterMark.new(gateway).execute({position: position_AI, player: false})
    grid = ViewGrid.new(gateway)
    expect(grid.execute({})).to eq({grid: " X | X | X \n-----------\n X | X | X \n-----------\n X | X | O \n"})
  end

  it "can play a game" do
    game = PlayGame.new
    expect(game.execute).to eq("AI").or eq("Player").or eq("Draw")
  end
end