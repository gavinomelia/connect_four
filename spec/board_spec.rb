require 'spec_helper'
require_relative '../lib/board'

RSpec.describe Board do
  let(:board) { Board.new }

  describe 'the board' do
    it 'is a 7x6 grid' do
      expect(board.board).to eq([
                                  [' ', ' ', ' ', ' ', ' ', ' '],
                                  [' ', ' ', ' ', ' ', ' ', ' '],
                                  [' ', ' ', ' ', ' ', ' ', ' '],
                                  [' ', ' ', ' ', ' ', ' ', ' '],
                                  [' ', ' ', ' ', ' ', ' ', ' '],
                                  [' ', ' ', ' ', ' ', ' ', ' '],
                                  [' ', ' ', ' ', ' ', ' ', ' ']
                                ])
    end
  end

  describe '#play' do
    it 'places a player mark in the lowest available row of the specified column' do
      board.play(0, 'X')
      expect(board.board[0][5]).to eq('X')
    end

    it 'stacks player marks in the same column' do
      board.play(0, 'X')
      board.play(0, 'O')
      expect(board.board[0][5]).to eq('X')
      expect(board.board[0][4]).to eq('O')
    end

    it 'returns false if the column is full' do
      6.times { board.play(0, 'X') }
      expect(board.play(0, 'O')).to be_falsey
    end
  end

  describe '#draw?' do
    it 'returns true if the board is full and there is no winner' do
      (0..6).each do |col|
        6.times { board.play(col, col.even? ? 'X' : 'O') }
      end
      expect(board.draw?).to eq(true)
    end

    it 'returns false if the board is not full' do
      board.play(0, 'X')
      expect(board.draw?).to eq(false)
    end

    it 'returns false if there is a winner' do
      4.times { |i| board.play(i, 'X') }
      expect(board.draw?).to eq(false)
    end
  end

  describe '#winner?' do
    it 'detects a horizontal win' do
      4.times { |i| board.play(i, 'X') }
      expect(board.winner?).to eq(true) 
    end

    it 'detects a vertical win' do
      4.times { board.play(1, 'X') }
      expect(board.winner?).to eq(true) 
    end

    it 'detects a diagonal win with positive slope' do
      board.play(0, 'X')
      board.play(1, 'O')
      board.play(1, 'X')
      board.play(2, 'O')
      board.play(2, 'O')
      board.play(2, 'X')
      board.play(3, 'O')
      board.play(3, 'O')
      board.play(3, 'O')
      board.play(3, 'X')
      board.display
      expect(board.winner?).to eq(true)
    end

    it 'detects a diagonal win with negative slope' do
      board.play(3, 'X')
      board.play(2, 'O')
      board.play(2, 'X')
      board.play(1, 'O')
      board.play(1, 'O')
      board.play(1, 'X')
      board.play(0, 'O')
      board.play(0, 'O')
      board.play(0, 'O')
      board.play(0, 'X')
      board.display
      expect(board.winner?).to eq(true)
    end
  end
end
