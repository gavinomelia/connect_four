# frozen_string_literal: true

require_relative '../lib/connect_four'

RSpec.describe 'Connect Four' do
  it 'initializes with an empty board' do
    game = Board.new
    expect(game.board.flatten).to all(be_nil)
  end
end