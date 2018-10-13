class Board
  
  def draw(marks = [])
    pos = 0
    5.times do |row|
      5.times do |col|
        if row % 2 == 0 && col % 2 == 0
          print marks[pos].nil? ? " " : marks[pos]
          pos += 1
        elsif row % 2 == 0 && col % 2 != 0
          print "|"
        else
          print "-"
        end 
      end
      puts "\n"
    end
  end
end