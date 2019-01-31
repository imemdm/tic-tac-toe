describe "player can mark a board position with his sign" do
  it "marks the correct position on the board" do
    board = Board.new

    player = Player.new("Emil", "x")

    allow($stdin).to receive(:gets).and_return("2")

    input = $stdin.gets

    marked_pos = player.convert_input(input)

    board.add_mark(mark: player.sign, position: marked_pos)

    expect { board.draw }.to output(/|x/).to_stdout
  end
end