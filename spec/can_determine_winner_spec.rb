describe "can determine round winner" do
  context "when there is a winning combination on the board" do
    it "increases the score of the round winner by 1" do
      board = Board.new

      player = Player.new("Emil", "x")

      board.add_mark(mark: player.sign, position: 0)
      board.add_mark(mark: player.sign, position: 1)
      board.add_mark(mark: player.sign, position: 2)

      current_score = player.score

      if player.won?(positions: board.extract_player_positions(sign: player.sign), 
                      conditions: board.win_conditions)
        player.increase_score
      end

      expect(player.score).to be(current_score + 1)
    end
  end
end