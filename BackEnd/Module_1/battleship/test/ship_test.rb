# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'

# Test the Ship class
class ShipTest < Minitest::Spec
  before do
    @length = 10
    @ship = Ship.new("Meow", @length)
  end

  describe 'Upon initialization' do
    it 'should be a Ship object' do
      assert_instance_of Ship, @ship
    end

    it 'has a name' do
      assert_equal @ship.name, "Meow"
    end

    it 'has a length' do
      assert_equal @ship.length, @length
    end

    it 'has health equal to its length' do
      assert_equal @ship.health, @length
    end

    it 'has not sunk yet' do
      assert_equal @ship.sunk?, false
    end
  end

  describe 'when hit' do
    it 'has less health points with each hit' do
      estimated_health = @length
      while !@ship.sunk?
        assert_equal @ship.health, estimated_health
        @ship.hit
        estimated_health -= 1
      end
      assert_equal @ship.sunk?, true
    end
  end
end