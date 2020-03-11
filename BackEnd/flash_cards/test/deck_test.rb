require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/card'

# Test the Deck class
class DeckTest < Minitest::Test
  def setup
    @card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @cards = [@card_1, @card_2, @card_3]
    @deck = Deck.new(@cards)
  end

  def test_it_exists
    assert_instance_of Deck, @deck
  end

  def test_it_has_cards
    assert_equal @deck.cards, @cards
  end

  def test_its_cards_are_cards
    @deck.cards.each do |card|
      assert_instance_of Card, card
    end
  end

  def test_its_deck_count_matches_card_array_size
    assert_equal @deck.count, @cards.size
  end

  def test_it_can_pull_cards_by_category
    cat = @deck.cards_in_category(:STEM)
    assert_equal cat.size, 2
  end

  def test_it_can_pull_correct_cards_by_category
    cat = @deck.cards_in_category(:Geography)
    assert_equal cat.first.category, :Geography
  end

  def test_it_can_pull_zero_card_if_nonexistent_category
    cat = @deck.cards_in_category("Pop Culture")
    assert_equal cat.size, 0
  end
end
