require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/card_generator'

# CLI class for Flashcard Game
class FlashCardRunner
  def self.display_start_message
    puts "Welcome! You're playing with #{@cards.size} cards."
    puts '-------------------------------------------------'
  end

  def self.end_message
    "You had #{@round.number_correct} correct guesses out of #{@cards.size}"
  end

  def self.display_end_message
    puts '****** Game over! ******'
    puts end_message + " for a total score of #{@round.percent_correct}%."
    @cards.group_by(&:category).each do |category, _card|
      percentage = @round.percent_correct_by_category(category)
      puts "#{category} - #{percentage}% correct"
    end
  end

  def self.display_game_turn_question
    current_card = @round.current_card
    current_card_index = @deck.cards.index(current_card) + 1
    puts "This is card number #{current_card_index} out of #{@cards.size}."
    puts "Question: #{current_card.question}"
  end

  def self.display_game_turn
    display_game_turn_question
    user_input = gets.chomp
    turn = @round.take_turn(user_input)
    puts turn.feedback
  end

  def self.create_round
    @cards = CardGenerator.new('cards.txt').cards
    @deck = Deck.new(@cards)
    @round = Round.new(@deck)
  end

  def self.start
    create_round
    display_start_message
    display_game_turn while @round.turns.size < @cards.size
    display_end_message
  end
end

FlashCardRunner.start
