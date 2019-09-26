describe Tree do

  it "checks the returned tree when there are 2 spots left" do
    expect(Tree.to_tree(['X','O','X',' ','O',' ','O','X','X'],false)).to eq(
      [{position: 3, children: [{position: 5, children: [], score: -10}], score: 0},
       {position: 5, children: [{position: 3, children: [], score: 0}], score: 0}])
  end

  it "checks the returned tree when there are 3 spots left" do
    expect(Tree.to_tree(['X','O',' ',' ','O',' ','O','X','X'],true)).to eq(
       [{position: 2, children: [{position: 3, children: [{position: 5, children: [], score: 0}], score: 0},{position: 5, children: [], score: 0}], score: 0},
        {position: 3, children: [{position: 2, children: [{position: 5, children: [], score: 0}], score: 0},{position: 5, children: [], score: 0}], score: 0},
        {position: 5, children: [{position: 2, children: [{position: 3, children: [], score: 0}], score: 0}], score: 0},{position: 3, children: [], score: 0}])
  end
end