class Turn
    attr_accessor(:guess, :card)

    def initialize(string, card)
        @guess = string
        @card = card
    end

    def correct?
        @guess == @card.answer
    end

    def feedback
        return self.correct? ? "Correct!" : "Incorrect."
    end
end