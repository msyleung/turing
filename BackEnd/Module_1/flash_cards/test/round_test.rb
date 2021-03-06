# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/pride'
require './lib/card_generator'
require './lib/deck'
require './lib/round'

# Test the Round class
class RoundTest < Minitest::Spec
  before do
    @cards = CardGenerator.new('cards.txt').cards
    @card1 = @cards.first
    @deck = Deck.new(@cards)
    @round = Round.new(@deck)
  end

  describe 'when round is created' do
    it 'should be a Round object' do
      _(@round).must_be_instance_of Round
    end

    it 'has a Deck' do
      _(@round.deck).must_be_instance_of Deck
    end

    it 'has empty turns' do
      _(@round.turns.empty?).must_equal true
    end

    it 'has a current card that is card1' do
      _(@round.current_card).must_equal @card1
    end
  end

  describe 'when turns are occuring' do
    describe 'when guess is correct' do
      let(:turn_with_correct_guess) do
        @round.take_turn(@card1.answer)
      end

      it 'returns a Turn object' do
        _(turn_with_correct_guess).must_be_instance_of Turn
      end

      it 'correct? returns true' do
        _(turn_with_correct_guess.correct?).must_equal true
      end

      it 'has turns' do
        _(@round.turns).must_equal [turn_with_correct_guess]
      end

      it 'has number correct' do
        turn_with_correct_guess
        _(@round.number_correct).must_equal 1
      end

      it 'has a new card after turn' do
        turn_with_correct_guess
        _(@round.current_card).wont_match @card1
      end
    end

    describe 'when turn guess is incorrect' do
      let(:turn_with_incorrect_guess) { @round.take_turn('Meow') }

      it 'correct? returns false' do
        _(turn_with_incorrect_guess.correct?).must_equal false
      end

      it 'has number correct' do
        turn_with_incorrect_guess
        _(@round.number_correct).must_equal 0
      end
    end

    describe 'when there are two turns (1 incorrect, 1 correct guess)' do
      before do
        @round.take_turn(@card1.answer)
        @round.take_turn('Meow')
      end

      it 'has a count of two turns' do
        _(@round.turns.count).must_equal 2
      end

      it 'has a last feedback of Incorrect' do
        _(@round.turns.last.feedback).must_equal 'Incorrect.'
      end

      it 'has number_correct of 1' do
        _(@round.number_correct).must_equal 1
      end

      it 'has accurate number correct by category' do
        _(@round.number_correct_by_category(@card1.category)).must_equal 1
        _(@round.number_correct_by_category('Turing Staff')).must_equal 0
      end

      it 'has accurate percent_correct' do
        _(@round.percent_correct).must_equal 50.0
      end

      it 'has accurate percent_correct_by_category' do
        _(@round.percent_correct_by_category(@card1.category)).must_equal 100.0
      end

      it 'has the third card as current_card' do
        _(@round.current_card).must_equal @cards[2]
      end
    end
  end
end
