# frozen_string_literal: true

require_relative './errors'

class Direction
  DIRECTIONS = %i[
    east
    south
    west
    north
  ].freeze

  def direction
    DIRECTIONS[@current]
  end

  def direction_vector(steps = 1)
    case direction
      when :east
        [0, steps]
      when :south
        [-steps, 0]
      when :west
        [0, -steps]
      when :north
        [steps, 0]
    else
      raise Errors::InvalidDirectionError
    end
  end

  # @param [Symbol] direction
  def initialize(direction)
    @current = DIRECTIONS.find_index(direction) || raise(Errors::InvalidDirectionError)
  end

  def left!
    @current = (@current - 1) % DIRECTIONS.length
  end

  def right!
    @current = (@current + 1) % DIRECTIONS.length
  end
end
