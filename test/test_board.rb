# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/board'
require_relative '../lib/position'

describe Board do
  before do
    @board = Board.new
    @position = Position.new
  end

  it 'should return true on correct position' do
    assert_equal true, @board.position?(2, 3)
  end

  it 'should return false on wrong position' do
    assert_equal false, @board.position?(6, 6)
  end

  it 'should return false on occupied position' do
    @position.x = 3
    @position.y = 3
    @board.occupy(@position)
    assert_equal false, @board.position?(3, 3)
  end

  it 'should return true on unoccupied position' do
    @position.x = 3
    @position.y = 3
    @board.occupy(@position)
    assert_equal true, @board.position?(2, 3)
  end

  it 'should have list of occupied positions' do
    @position.x = 3
    @position.y = 3
    @board.occupy(@position)
    assert_equal 1, @board.occupied.length
  end

  it 'should empty positon from list of occupied' do
    @position.x = 3
    @position.y = 3
    @board.occupy(@position)
    @board.empty(@position)
    assert_equal 0, @board.occupied.length
  end
end
