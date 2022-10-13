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

  # @param [Symbol] direction
  def initialize(direction)
    @current = DIRECTIONS.find_index(direction) || raise(Errors::InvalidDirectionError)
  end

  def left!
    @current = (@current + 1) % DIRECTIONS.length
  end

  def right!
    @current = (@current - 1) % DIRECTIONS.length
  end
end
