# Deck of cards
class Deck
  attr_accessor(:cards)

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.size
  end

  def cards_in_category(category)
    @cards.select { |x| x.category == category }
  end
end
