require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/game'
require './lib/card_generator'

filename = "cards.txt"

cards = CardGenerator.new(filename).cards
standard_deck = CardGenerator.new(filename).deck(cards)

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