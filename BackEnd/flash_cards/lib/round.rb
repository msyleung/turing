# Create a Round of Game in Flashcards
class Round
  attr_accessor(:deck, :turns, :current_card)

  def initialize(deck)
    @deck = deck
    @turns = []
    set_current_card
  end

  def set_current_card
    @current_card = @deck.cards[@turns.size]
  end

  def take_turn(guess)
    @turns.push(Turn.new(guess, @current_card))
    set_current_card
    @turns.last
  end

  def number_correct
    @turns.select(&:correct?).size
  end

  def number_correct_by_category(category)
    @turns.select { |t| t.correct? && t.card.category == category }.size
  end

  def round_two(num)
    num.round(1)
  end

  def percent_correct
    round_two((number_correct.to_f / @turns.size) * 100)
  end

  def percent_correct_by_category(category)
    round_two((number_correct_by_category(category).to_f / 
    @turns.select { |t| t.card.category == category }.size) * 100)
  end
end
