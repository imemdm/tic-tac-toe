class Player
  attr_reader :name, :score

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
