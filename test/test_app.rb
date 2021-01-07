# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/app'

describe App do
  it 'should initialize class properly' do
    app = App.new
    assert_equal false, app.exiting
  end

  it 'should set exiting to true for EXIT command' do
    app = App.new
    app.handle 'EXIT'
    assert_equal true, app.exiting
  end

  it 'should get proper report' do
    app = App.new
    app.handle 'BOB: PLACE 1,2,EAST'
    assert_equal 'BOB: 1, 2, EAST', app.handle('BOB: REPORT')
  end
end
