require 'game'

describe Game do

  subject(:game) { described_class.new(player, player2) }
  let(:player) { double :player }
  let(:player2) { double :player }
  
  describe '#player_1' do
    it 'retrieves the first player' do
      expect(game.player1).to eq player
    end
  end

  describe '#player_2' do
    it 'retrieves the second player' do
      expect(game.player2).to eq player2
    end
  end
  
  describe '#attack' do
    it 'damages the player' do
      expect(player2).to receive(:receive_damage)
      game.attack()      
    end
  end

  describe '#player_turn' do
  it 'starts as player 1' do
    expect(game.player_turn).to eq player
  end
end

  describe "#switch_turns" do
    it "switches which player's turn it is" do
      game.switch_turns
      expect(game.player_turn).to eq(player2)
    end
  end

end