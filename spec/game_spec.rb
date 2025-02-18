require_relative '../lib/game'

RSpec.describe Game do
  it 'starts the game' do
    game = Game.new
    expect(game).to be_an_instance_of(Game)
  end
end
