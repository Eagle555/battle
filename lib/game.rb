class Game
  attr_reader :player1, :player2, :player_turn
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @player_turn = player1
  end

  def self.create(player_1, player_2)
    @game = Game.new(player_1, player_2)
  end
  
  def self.instance
    @game
  end
  
  def attack
    if player_turn == player1
      player2.receive_damage
    else
      player1.receive_damage
    end
    switch_turns
  end

  def switch_turns
    @player_turn == player1 ? @player_turn = player2 : @player_turn = player1
  end

end
