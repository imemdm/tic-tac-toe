describe "can determine round winner" do
  context "when there is a winning combination on the board" do
    it "increases the score of the round winner by 1" do
      board = Board.new
      player = Player.new("Emil", "x")

      current_score = player.score

      player.add_position(position: 0)
      player.add_position(position: 1)
      player.add_position(position: 2)

      if player.won?(conditions: board.win_conditions)
        player.increase_score
      end

      expect(player.score).to be(current_score + 1)
    end
  end
end