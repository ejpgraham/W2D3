require 'deck'

describe Deck do
  describe "#initialize" do
    subject(:init_deck) { Deck.new }

    it "creates an array with 52 Cards" do
        expect(init_deck.cards).to_not be_nil
        expect(init_deck.cards.length).to eq(52)
    end

    it "creates 13 cards of each suit" do
      suit_count = Hash.new { |h,k| h[k] = 0 }
      init_deck.cards.each do |card|
        suit_count[card.suit] += 1
        # if suit_count[card.suit]
        #   suit_count[card.suit] += 1
        # else
        #   suit_count[card.suit] = 1
      end
      suit_count.each do |suit, count|
        expect(count).to eq(13)
      end
    end
  end
end
