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

  def draw?
    false
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
    horizontal_winner? || vertical_winner? || diagonal_winner?
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

  # Iterates through possible starting positions on the board and checks for four consecutive
  # pieces of the same type in both diagonal directions (bottom-left to top-right and top-left to bottom-right).
  def diagonal_winner?
    # Only need to check diagonals starting in columns 0..3 because anything higher would end out-of-bounds.
    (0..3).each do |col|
      (0..2).each do |row|
        # bottom-left to top-right
        return true if all_same?([@board[col][row], @board[col+1][row+1], @board[col+2][row+2], @board[col+3][row+3]])
        # top-left to bottom-right 
        return true if all_same?([@board[col][row+3], @board[col+1][row+2], @board[col+2][row+1], @board[col+3][row]])
      end
    end
    false
  end
end
