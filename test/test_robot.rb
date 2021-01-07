# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/robot'

describe Robot do
  it 'should have correct name' do
    robot = Robot.new 'BOB', nil
    assert_equal 'BOB', robot.name
  end

  it 'should have correct nil position' do
    robot = Robot.new 'BOB', nil
    assert_nil robot.position
  end

  it 'should have correct position' do
    robot = Robot.new 'BOB', 'some_position'
    assert_equal 'some_position', robot.position
  end
end
