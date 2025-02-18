class Board
  attr_accessor :board

  def initialize
    @board = Array.new(7) { Array.new(6, ' ') }
  end

  def play(col, player)
    return false if col < 0 || col >= @board.size
    return false if @board[col].all? { |cell| cell != ' ' }

    row = @board[col].rindex(' ')
    @board[col][row] = player
    true
  end

  def display
    puts "\n0 1 2 3 4 5 6"
    (0..5).each do |row|
      (0..6).each do |col|
        print @board[col][row] == ' ' ? "\u25CB " : "#{@board[col][row]} "
      end
      puts
    end
  end

  def draw?
    false
  end

  def winner? 
    false
  end
end