# frozen_string_literal: true

# Class to make cards
class Card
  attr_accessor(:question, :answer, :category)

  def initialize(question, answer, category)
    @question = question
    @answer = answer
    @category = category
  end
end
