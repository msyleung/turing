# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/card_generator'

# Test the Deck class
class DeckTest < Minitest::Test
  def setup
    @cards = CardGenerator.new('cards.txt').cards
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
    cat = @deck.cards_in_category('STEM')
    assert_equal cat.size, 3
  end

  def test_it_can_pull_correct_cards_by_category
    cat = @deck.cards_in_category('Geography')
    assert_equal cat.first.category, 'Geography'
  end

  def test_it_can_pull_zero_card_if_nonexistent_category
    cat = @deck.cards_in_category('Cats')
    assert_equal cat.size, 0
  end
end
