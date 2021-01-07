# frozen_string_literal: true

# Board Class
class Board
  attr_accessor :occupied

  def initialize
    @left = 0
    @bottom = 0
    @right = 5
    @top = 5
    self.occupied = []
  end

  def position?(pos_x, pos_y)
    pos_x.between?(@left, @right) && pos_y.between?(@bottom, @top) && !occupied?(pos_x, pos_y)
  end

  def occupy(position)
    occupied << { x: position.x, y: position.y }
  end

  def empty(position)
    target = occupied.find { |slot| slot[:x] == position.x && slot[:y] == position.y }
    self.occupied -= [target]
  end

  def occupied?(pos_x, pos_y)
    !!occupied.find { |slot| slot[:x] == pos_x && slot[:y] == pos_y }
  end
end
