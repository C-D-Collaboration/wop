require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/game'

suits = [:heart, :spade, :diamond, :club]

standard_deck = []

suits.each do |suit|
  2.upto(10) do |number|
    standard_deck << Card.new(suit, "#{number}", number)
  end
  standard_deck << Card.new(suit, "Jack", 11)
  standard_deck << Card.new(suit, "Queen", 12)
  standard_deck << Card.new(suit, "King", 13)
  standard_deck << Card.new(suit, "Ace", 14)
end

standard_deck.shuffle!

deck1 = Deck.new([])
deck2 = Deck.new([])

26.times do 
  deck1.add_card(standard_deck.pop)
  deck2.add_card(standard_deck.pop)
end

player1 = Player.new("Megan", deck1)
player2 = Player.new("Aurora", deck2)

game = Game.new(player1, player2)
game.start