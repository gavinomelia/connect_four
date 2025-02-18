class Board
  attr_accessor :board

  def initialize
    @board = Array.new(7) { Array.new(6, ' ') }
  end

  def play(col, player)
    return false if col.negative? || col >= @board.size
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

  def winner?
    horizontal_winner? || vertical_winner?
  end

  private

  def all_same?(arr)
    arr.uniq.size == 1 && arr.first != ' '
  end

  def horizontal_winner?
    (0..5).each do |row|
      (0..3).each do |col|
        return true if all_same?([@board[col][row], @board[col+1][row], @board[col+2][row], @board[col+3][row]])
      end
    end
    false
  end

  def vertical_winner?
    @board.each do |col|
      col.each_cons(4) do |four_in_col|
        return true if all_same?(four_in_col)
      end
    end
    false
  end

  def draw?
    false
  end
end
