class Player
  attr_reader :name, :score, :mark

  def initialize(name, sign)
    @name = name
    @sign = sign
    @score = 0
  end

  def mark(pos, marks)
    pos = pos - 1
    marks[pos] = @sign
  end

  def valid_mark?(pos, marks)
    pos = pos - 1
    marks[pos].nil? && (pos >= 0 && pos <= 8)
  end
end

marks = Array.new(9)

p1 = Player.new("emil", "x")
p2 = Player.new("tatyana", "o")

