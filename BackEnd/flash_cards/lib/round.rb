class Round
    attr_accessor(:deck, :turns, :current_card)

    def initialize(deck)
        @deck = deck
        @turns = []
        set_current_card
    end

    def set_current_card
        @current_card = @deck.cards.first
    end

    def move_first_card_to_end
        first_card = @deck.cards.shift
        @deck.cards.push(first_card)
        set_current_card
    end
    
    def take_turn(guess)
        @turns << Turn.new(guess, @current_card)
        move_first_card_to_end
        @turns.last
    end

    def number_correct
        @turns.select { |t| t.correct? }.size
    end

    def number_correct_by_category(category)
        @turns.select { |t| t.correct? && t.card.category == category }.size
    end

    def percent_correct
        (number_correct.to_f / @turns.size) * 100
    end

    def percent_correct_by_category(category)
        (number_correct_by_category(category).to_f / 
        @turns.select { |t| t.card.category == category }.size) * 100
    end

end