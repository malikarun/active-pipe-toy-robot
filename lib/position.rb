# frozen_string_literal: true

require_relative 'base'

# Position Class
class Position < Base
  attr_accessor :x, :y, :facing

  VALID_DIRECTIONS = %w[NORTH SOUTH EAST WEST].freeze

  def coords
    [x, y]
  end

  def place(*place_args)
    pos_x = place_args[0]
    pos_y = place_args[1]
    direction = place_args[2]

    # Info for missing or invalid args
    return p 'Please provide all coordinate: X, Y, DIRECTION' if pos_x.nil? || pos_y.nil? || direction.nil?

    return p 'Please enter a valid direction' unless VALID_DIRECTIONS.include?(direction.upcase)

    return unless @@board.position? pos_x.to_i, pos_y.to_i

    place_on_position(pos_x, pos_y, direction)
  end

  def move
    x, y = coords
    case facing
    when 'NORTH' then place x, y + 1, facing
    when 'EAST' then place x + 1, y, facing
    when 'SOUTH' then place x, y - 1, facing
    when 'WEST' then place x - 1, y, facing
    end
  end

  def left
    case facing
    when 'NORTH' then self.facing = 'WEST'
    when 'EAST' then self.facing = 'NORTH'
    when 'SOUTH' then self.facing = 'EAST'
    when 'WEST' then self.facing = 'SOUTH'
    end
  end

  def right
    case facing
    when 'NORTH' then self.facing = 'EAST'
    when 'EAST' then self.facing = 'SOUTH'
    when 'SOUTH' then self.facing = 'WEST'
    when 'WEST' then self.facing = 'NORTH'
    end
  end

  def report
    [coords, facing].flatten.join(', ')
  end

  private

  def place_on_position(pos_x, pos_y, direction)
    @@board.empty(self)
    self.x = pos_x.to_i
    self.y = pos_y.to_i
    self.facing = direction
    @@board.occupy(self)
  end
end
