#card
require "card"

describe Card do
  subject(:card) { Card.new(2, :hearts) }

  describe "#initialize" do
    it "takes in and sets a card value" do
      expect(card.value).to eq(2)
      expect(card.value).to be_between(2, 14).inclusive
    end

    it "takes in and sets a card suit" do
      expect(card.suit).to eq(:hearts)
      expect(Card::SUITS).to include(card.suit)
    end
  end
end
