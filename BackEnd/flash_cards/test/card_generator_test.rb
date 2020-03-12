# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/pride'
require './lib/card_generator'

class CardGeneratorTest < Minitest::Test
  def test_it_exists
    cards = CardGenerator.new('cards.txt')

    assert_instance_of CardGenerator, cards
  end

  def test_it_returns_cards
    cards = CardGenerator.new('cards.txt').cards

    cards.each do |card|
      assert_instance_of Card, card
    end
  end

  def test_it_returns_empty
    cards = CardGenerator.new('./test/empty.txt').cards

    assert_equal cards.empty?, true
  end

  def test_it_raises_error_if_improper_format
    assert_raises(RuntimeError, 'Improper file format') { CardGenerator.new('./test/format_test.txt') }
  end
end