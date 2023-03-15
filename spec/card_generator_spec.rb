require './lib/card_generator'

RSpec.describe CardGenerator do 
  describe "Iteration 4" do 
    it "exists" do 
      filename = "cards.txt"
      card_gen = CardGenerator.new(filename)

      expect(card_gen).to be_an_instance_of(CardGenerator)
    end

    it "#cards" do 
      filename = "cards.txt"
      card_gen = CardGenerator.new(filename)

      expect(card_gen.cards).to be_an(Array)
      expect(card_gen.cards.first).to be_an_instance_of(Card)
    end

    it "#deck" do 
      filename = "cards.txt"
      card_gen = CardGenerator.new(filename)
      cards = card_gen.cards
      
      expect(card_gen.deck(cards)).to be_an(Array)
      expect(card_gen.deck(cards).first).to be_an_instance_of(Card)
    end
  end
end