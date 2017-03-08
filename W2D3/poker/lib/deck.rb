require_relative 'card'

class Deck
  def cards
    Array.new(52) { Card.new(2, :hearts) }
  end
end
