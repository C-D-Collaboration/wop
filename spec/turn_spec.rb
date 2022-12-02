 require './lib/card'
 require './lib/deck'
 require './lib/player'
 require './lib/turn'

 RSpec.describe Turn do 
  describe 'can create a turn with players' do 
    it 'exists' do 
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10)    
      card3 = Card.new(:heart, '9', 9)    
      card4 = Card.new(:diamond, 'Jack', 11)    
      card5 = Card.new(:heart, '8', 8)    
      card6 = Card.new(:diamond, 'Queen', 12)    
      card7 = Card.new(:heart, '3', 3)    
      card8 = Card.new(:diamond, '2', 2)    

      deck1 = Deck.new([card1, card2, card5, card8])    
      deck2 = Deck.new([card3, card4, card6, card7])    

      player1 = Player.new("Megan", deck1)    
      player2 = Player.new("Aurora", deck2)    

      turn = Turn.new(player1, player2)  
      
      expect(turn).to be_a(Turn)
    end

    it 'has player attributes' do 
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10)    
      card3 = Card.new(:heart, '9', 9)    
      card4 = Card.new(:diamond, 'Jack', 11)    
      card5 = Card.new(:heart, '8', 8)    
      card6 = Card.new(:diamond, 'Queen', 12)    
      card7 = Card.new(:heart, '3', 3)    
      card8 = Card.new(:diamond, '2', 2)    

      deck1 = Deck.new([card1, card2, card5, card8])    
      deck2 = Deck.new([card3, card4, card6, card7])    

      player1 = Player.new("Megan", deck1)    
      player2 = Player.new("Aurora", deck2)    

      turn = Turn.new(player1, player2) 

      expect(turn.player1).to eq(player1)
      expect(turn.player2).to eq(player2)
    end

    it 'has deck attributes' do 
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10)    
      card3 = Card.new(:heart, '9', 9)    
      card4 = Card.new(:diamond, 'Jack', 11)    
      card5 = Card.new(:heart, '8', 8)    
      card6 = Card.new(:diamond, 'Queen', 12)    
      card7 = Card.new(:heart, '3', 3)    
      card8 = Card.new(:diamond, '2', 2)    

      deck1 = Deck.new([card1, card2, card5, card8])    
      deck2 = Deck.new([card3, card4, card6, card7])    

      player1 = Player.new("Megan", deck1)    
      player2 = Player.new("Aurora", deck2)    

      turn = Turn.new(player1, player2) 

      expect(deck1).to be_a(Deck)
      expect(deck2).to be_a(Deck)
      expect(turn.player1.deck.cards.size).to eq(4)
      expect(turn.player2.deck.cards.size).to eq(4)
    end
  end 

  describe 'basic turn' do 
    it 'starts with an empty spoils array' do 
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10)    
      card3 = Card.new(:heart, '9', 9)    
      card4 = Card.new(:diamond, 'Jack', 11)    
      card5 = Card.new(:heart, '8', 8)    
      card6 = Card.new(:diamond, 'Queen', 12)    
      card7 = Card.new(:heart, '3', 3)    
      card8 = Card.new(:diamond, '2', 2)    

      deck1 = Deck.new([card1, card2, card5, card8])    
      deck2 = Deck.new([card3, card4, card6, card7])    

      player1 = Player.new("Megan", deck1)    
      player2 = Player.new("Aurora", deck2)    

      turn = Turn.new(player1, player2) 

      expect(turn.spoils_of_war).to eq([])
    end

    it 'has turn type of basic if each players top card does not match' do 
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10)    
      card3 = Card.new(:heart, '9', 9)    
      card4 = Card.new(:diamond, 'Jack', 11)    
      card5 = Card.new(:heart, '8', 8)    
      card6 = Card.new(:diamond, 'Queen', 12)    
      card7 = Card.new(:heart, '3', 3)    
      card8 = Card.new(:diamond, '2', 2)    

      deck1 = Deck.new([card1, card2, card5, card8])    
      deck2 = Deck.new([card3, card4, card6, card7])    

      player1 = Player.new("Megan", deck1)    
      player2 = Player.new("Aurora", deck2)    

      turn = Turn.new(player1, player2) 

      expect(turn.type).to eq(:basic)
    end

    it 'can determine a winner for basic if top card is higher' do 
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10)    
      card3 = Card.new(:heart, '9', 9)    
      card4 = Card.new(:diamond, 'Jack', 11)    
      card5 = Card.new(:heart, '8', 8)    
      card6 = Card.new(:diamond, 'Queen', 12)    
      card7 = Card.new(:heart, '3', 3)    
      card8 = Card.new(:diamond, '2', 2)    

      deck1 = Deck.new([card1, card2, card5, card8])    
      deck2 = Deck.new([card3, card4, card6, card7])    

      player1 = Player.new("Megan", deck1)    
      player2 = Player.new("Aurora", deck2)    

      turn = Turn.new(player1, player2) 

      expect(turn.type).to eq(:basic)
      winner = turn.winner
      expect(winner).to eq(player1)
    end

    it 'can pile cards into spoils pile for basic turn' do 
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10)    
      card3 = Card.new(:heart, '9', 9)    
      card4 = Card.new(:diamond, 'Jack', 11)    
      card5 = Card.new(:heart, '8', 8)    
      card6 = Card.new(:diamond, 'Queen', 12)    
      card7 = Card.new(:heart, '3', 3)    
      card8 = Card.new(:diamond, '2', 2)    

      deck1 = Deck.new([card1, card2, card5, card8])    
      deck2 = Deck.new([card3, card4, card6, card7])    

      player1 = Player.new("Megan", deck1)    
      player2 = Player.new("Aurora", deck2)    

      turn = Turn.new(player1, player2)

      expect(turn.type).to eq(:basic)
      winner = turn.winner
      turn.pile_cards
      expect(turn.spoils_of_war).to eq([card1, card3])
    end

    it 'can award spoils of basic turn to winner' do 
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10)    
      card3 = Card.new(:heart, '9', 9)    
      card4 = Card.new(:diamond, 'Jack', 11)    
      card5 = Card.new(:heart, '8', 8)    
      card6 = Card.new(:diamond, 'Queen', 12)    
      card7 = Card.new(:heart, '3', 3)    
      card8 = Card.new(:diamond, '2', 2)    

      deck1 = Deck.new([card1, card2, card5, card8])    
      deck2 = Deck.new([card3, card4, card6, card7])    

      player1 = Player.new("Megan", deck1)    
      player2 = Player.new("Aurora", deck2)    

      turn = Turn.new(player1, player2)

      expect(turn.type).to eq(:basic)
      winner = turn.winner 
      turn.pile_cards
      expect(turn.spoils_of_war).to eq([card1, card3])
      turn.award_spoils(winner)
      expect(player1.deck.cards).to eq([card2, card5, card8, card1, card3])
      expect(player2.deck.cards).to eq([card4, card6, card7])
    end
  end
 end