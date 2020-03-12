# frozen_string_literal: true

require_relative 'card'

# Class to mass-generate cards from a given file
class CardGenerator
  attr_reader(:cards)

  def initialize(file_name)
    @cards = []
    File.read(file_name).split("\n").each do |line|
      line_array = line.split(',')
      raise 'Improper file format' if line_array.size != 3

      @cards << Card.new(line_array[0], line_array[1], line_array[2])
    end
  end
end
