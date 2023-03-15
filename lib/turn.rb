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
    if mad_type
      :mutually_assured_destruction
    elsif basic_type
      :basic 
    else war_type
      :war
    end
  end

  def mad_type
    (player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2))
  end

  def basic_type
    (player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0))
  end

  def war_type
    (player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0))
  end

  def winner 
    if type == :basic 
      if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
        player1
      else
        player2
      end
    elsif type == :war
      if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
        player1
      else
        player2
      end
    else type == :mutually_assured_destruction
      "No Winner"
    end
  end

  def pile_cards 
    if type == :basic
      @spoils_of_war << player1.deck.remove_card
      @spoils_of_war << player2.deck.remove_card
    elsif type == :war 
      3.times do 
        @spoils_of_war << player1.deck.remove_card
      end
      3.times do 
        @spoils_of_war << player2.deck.remove_card
      end
    else type == :mutually_assured_destruction
      3.times do 
        player1.deck.remove_card
        player2.deck.remove_card
      end
    end
  end

  def award_spoils(winner)
    # @spoils_of_war.shuffle!
    if winner.class == Player 
      until @spoils_of_war.empty? do 
        winner.deck.add_card(@spoils_of_war.shift)
      end
    end
    # winner.deck.cards.concat(spoils_of_war)
  end
end