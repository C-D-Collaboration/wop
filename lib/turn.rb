class Turn 
  attr_reader :player1,
              :player2,
              :spoils_of_war

  def initialize(player1, player2)
    @player1       = player1
    @player2       = player2
    @spoils_of_war = []
  end

  def type 
    if (player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)) 
      :basic 
    end
  end

  def winner 
    return player1 if type == :basic && player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
  end

  def pile_cards 
    if type == :basic
      @spoils_of_war << player1.deck.remove_card
      @spoils_of_war << player2.deck.remove_card
    end
  end

  def award_spoils(winner)
    require 'pry'; binding.pry
    winner.deck.cards.concat(spoils_of_war)
  end
end