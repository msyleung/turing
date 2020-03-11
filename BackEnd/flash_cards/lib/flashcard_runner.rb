require './card'
require './turn'
require './deck'
require './round'

module FLASHCARD_RUNNER
    def self.create_round
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        @deck = Deck.new([card_1, card_2, card_3])
        @deck_size = @deck.count
        @round = Round.new(@deck)
        puts "Welcome! You're playing with #{@deck_size} cards.\n-------------------------------------------------\n"
    end

    def self.end_game_content
        puts '****** Game over! ******'
        puts "You had #{@round.number_correct} correct guesses out of #{@deck_size} for a total score of #{@round.percent_correct}%."
        @deck.cards.group_by(&:category).each do |category, card|
            puts "#{category} - #{@round.percent_correct_by_category(category)}% correct"
        end
    end

    def self.start
        self.create_round
        while @round.turns.size < @deck_size
            current_card_index = @deck.cards.index(@round.current_card) + 1
            puts "This is card number #{current_card_index} out of #{@deck_size}."
            puts "Question: #{@round.current_card.question}"
            user_input = gets.chomp
            @round.take_turn(user_input)
            puts @round.turns.first.feedback
        end
        self.end_game_content
    end
end

FLASHCARD_RUNNER.start