# frozen_string_literal: true

# Creating the Ship class for Battleship
class Ship
  attr_reader :name, :length, :health

  def initialize(name, length)
    @name = name
    @length = length
    @health = length
  end

  def sunk?
    return @health <= 0 ? true : false 
  end

  def hit
    @health -= 1
  end

end