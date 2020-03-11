# Class to create Turns in a Game
class Turn
  attr_accessor(:guess, :card)

  def initialize(string, card)
    @guess = string
    @card = card
  end

  def correct?
    @guess.casecmp(@card.answer).zero?
  end

  def feedback
    correct? ? 'Correct!' : 'Incorrect.'
  end
end
