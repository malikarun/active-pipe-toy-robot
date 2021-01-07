# frozen_string_literal: true

require_relative 'position'

# Robot Class
class Robot
  attr_accessor :name, :position

  def initialize(name, position)
    self.name = name
    self.position = position
  end
end
