# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/position'

describe Position do
  it 'should have correct coords' do
    position = Position.new
    position.x = 1
    position.y = 1
    assert_equal [1, 1], position.coords
  end

  it 'should have correct coords when placing' do
    position = Position.new
    position.place(2, 2, 'EAST')
    assert_equal [2, 2], position.coords
  end

  it 'should be able move forward in the same direction' do
    position = Position.new
    position.place(3, 3, 'EAST')
    position.move
    assert_equal [4, 3], position.coords
  end

  it 'should be able to go left' do
    position = Position.new
    position.place(4, 4, 'EAST')
    position.left
    assert_equal [4, 4], position.coords
    assert_equal 'NORTH', position.facing
  end

  it 'should be able to go left' do
    position = Position.new
    position.place(5, 5, 'EAST')
    position.right
    assert_equal [5, 5], position.coords
    assert_equal 'SOUTH', position.facing
  end

  it 'should be able provide report' do
    position = Position.new
    position.place(1, 5, 'EAST')
    assert_equal '1, 5, EAST', position.report
  end
end
