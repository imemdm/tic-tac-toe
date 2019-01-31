require "./lib/Player"

RSpec.describe Player do
  describe "#convert_input" do
    it "converts a numeric string to an integer value" do
      player = Player.new("Emil", "x")

      expect(player.convert_input("12")).to eql(12)
    end

    it "returns nil if the given string is not numeric" do
      player = Player.new("Emil", "x")

      expect(player.convert_input("[")).to be_nil
      expect(player.convert_input("a")).to be_nil
    end
  end

  describe "#add_position" do
    it "adds the position to the players' positions" do
      player = Player.new("Emil", "x")

      player.add_position(position: 1)

      expect(player.positions).to include(1)
    end
  end

  describe "#won?" do
    it "returns true if the player has won the round" do
      board = Board.new

      player = Player.new("Emil", "x")

      player.add_position(position: 0)
      player.add_position(position: 1)
      player.add_position(position: 2)

      expect(player.won?(conditions: board.win_conditions)).to eq(true)
    end

    it "returns false if the player hasn't won the round" do
      board = Board.new

      player = Player.new("Emil", "x")

      player.add_position(position: 0)

      expect(player.won?(conditions: board.win_conditions)).to eq(false)
    end
  end

  describe "#increase_score" do
    it "adds 1 to the players' score" do
      player = Player.new("Emil", "x")

      current_score = player.score

      player.increase_score

      expect(player.score).to eq(current_score + 1)
    end
  end
end
