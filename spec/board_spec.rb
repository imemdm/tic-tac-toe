require "./lib/Board"

RSpec.describe Board do
  subject(:board) { board = Board.new }

  describe "#add_mark" do
    it "adds the correct mark" do
      board.add_mark(mark: "x", position: 1)

      expect(board.marks).to include("x")
    end

    it "adds the mark to the correct position" do
      board.add_mark(mark: "x", position: 4)

      expect(board.marks[4]).to eq("x")
    end
  end

  describe "#valid_position?" do
    it "returns false if the passed position is out of range" do   
      expect(board.valid_position?(position: 10)).to eq(false)
      expect(board.valid_position?(position: -1)).to eq(false)
    end

    it "returns false if the passed position is already marked" do
      board.add_mark(mark: "x", position: 0)

      expect(board.valid_position?(position: 0)).to eq(false)
    end

    it "returns true if the passed position is in range and not previously marked" do
      expect(board.valid_position?(position: 0)).to eq(true)
    end
  end

  describe "#draw" do
    context "when no marks are added" do
      it "displays an empty board" do
        expect { board.draw }.to_not output(/x/).to_stdout
        expect { board.draw }.to_not output(/o/).to_stdout
      end
    end

    context "when marks are added" do 
      it "displays the marks at the correct positions" do
        board.add_mark(mark: "x", position: 0)
        board.add_mark(mark: "o", position: 1)
        board.add_mark(mark: "o", position: 2)

        expect { board.draw }.to output(/x|o|o/).to_stdout
      end
    end
  end

  describe "#extract_player_positions" do
    it "returns an empty array if no marks on the board" do
      expect(board.extract_player_positions(sign: "x")).to eq([])
      expect(board.extract_player_positions(sign: "o")).to eq([])
    end

    it "returns the correct positions for the given sign" do
      board.add_mark(mark: "x", position: 0)
      board.add_mark(mark: "x", position: 1)

      expect(board.extract_player_positions(sign: "x")).to eq([0, 1])
    end

    it "doesn't add positions for the other sign" do
      board.add_mark(mark: "x", position: 0)
      board.add_mark(mark: "o", position: 4)
      board.add_mark(mark: "o", position: 3)

      expect(board.extract_player_positions(sign: "x")).to eq([0])
      expect(board.extract_player_positions(sign: "x").length).to eq(1)
    end
  end

  describe "#full?" do
    it "returns true if the board is full" do
      (0..8).each { |n| board.add_mark(mark: "x", position: n) }

      expect(board.full?).to eq(true)
    end

    it "returns false if there are empty positions on the board" do
      expect(board.full?).to eq(false)
    end
  end
end