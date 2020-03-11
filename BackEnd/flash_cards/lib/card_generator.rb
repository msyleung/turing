require_relative 'card'

class CardGenerator
                attr_reader(:cards)

                def initialize(file_name)
                                @cards = []
                                File.read(file_name).split("\n").each do |line|
                                                line_array = line.split(',')
                                                @cards << Card.new(line_array[0], line_array[1], line_array[2])
                                end
                end
end