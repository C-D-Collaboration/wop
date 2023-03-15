require './lib/card'

class CardGenerator

  def initialize(filename)
    @filename = filename
    @standard_deck = []
  end

  def cards
    IO.readlines(@filename, chomp: true).map do |line|
      card_info = line.split(',')
      value = card_info[0]
      suit = card_info[1].lstrip.to_sym
      rank = card_info[2].lstrip.to_i
      Card.new(suit, value, rank)
    end
  end

  def deck(cards)
    @standard_deck << cards  
    @standard_deck.flatten
  end
end