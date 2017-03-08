class Card
  SUITS = [:diamond, :hearts, :spade, :club]
  attr_reader :value, :suit

  def initialize(value, suit)
    @value = value
    @suit = suit
  end

end
