class Player
  attr_reader :name
  attr_accessor :score, :sign

  def initialize(name, sign)
    @name = name
    @sign = sign
    @score = 0
  end

  def increase_score
    self.score += 1
  end
end
