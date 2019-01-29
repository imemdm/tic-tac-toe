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
end