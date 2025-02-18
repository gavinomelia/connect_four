class Board
  attr_accessor :board

  def initialize
    @board = Array.new(6, Array.new(7))
  end

  def display
    board
    '◯ ◯ ◯ ◯ ◯ ◯ ◯
     ◯ ◯ ◯ ◯ ◯ ◯ ◯
     ◯ ◯ ◯ ◯ ◯ ◯ ◯
     ◯ ◯ ◯ ◯ ◯ ◯ ◯
     ◯ ◯ ◯ ◯ ◯ ◯ ◯
     ◯ ◯ ◯ ◯ ◯ ◯ ◯'
  end
end

b = Board.new
p b.display