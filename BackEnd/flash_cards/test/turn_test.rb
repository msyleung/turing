require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'

# Test the Turn class
class TurnTest < Minitest::Test
  def setup
    @card = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    @turn = Turn.new('Juneau', @card)
  end

  def test_it_exists
    assert_instance_of Turn, @turn
  end

  def test_its_card_equals_card
    assert_equal @turn.card, @card
  end

  def test_it_has_an_guess
    assert_equal 'Juneau', @turn.guess
  end

  def test_it_checks_correctness
    assert_equal @turn.correct?, true
  end

  def test_it_checks_incorrectness
    turn = Turn.new('Meow', @card)

    assert_equal turn.correct?, false
  end

  def test_it_gives_correct_feedback
    assert_equal @turn.feedback, 'Correct!'
  end

  def test_it_gives_incorrect_feedback
    turn = Turn.new('Meow', @card)

    assert_equal turn.feedback, 'Incorrect.'
  end
end
