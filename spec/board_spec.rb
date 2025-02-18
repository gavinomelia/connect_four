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

  describe '#winner?' do
    it 'detects a horizontal win' do
      4.times { |i| board.play(i, 'X') }
      expect(board.winner?).to eq(true) 
    end

    it 'detects a vertical win' do
      4.times { board.play(1, 'X') }
      expect(board.winner?).to eq(true) 
    end
  end
end