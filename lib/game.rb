require_relative 'board'

class Game
  def initialize
    @board = Board.new
    @current_player = 'X'
  end

  def start
    puts 'Welcome to Connect 4. Alternate moves until one player gets four pieces in a row or all spaces are filled.'
    play_turn until @board.winner? || @board.draw?
    end_game
  end

  def play_turn
    puts 'playing game...'
    @board.display
    col = request_move
    unless @board.play(col, @current_player)
      puts 'Invalid move, try again.'
      return
    end
    switch_player
  end

  def end_game
    @board.display
    switch_player # switch back to the winning player
    if @board.winner?
      puts "Player #{@current_player} wins!"
    else
      puts 'The game is a draw! Bummer. Try again.'
    end
  end

  private

  def request_move
    puts 'Enter column:'
    gets.chomp.to_i
  end

  def switch_player
    @current_player = @current_player == 'X' ? 'O' : 'X'
  end
end
