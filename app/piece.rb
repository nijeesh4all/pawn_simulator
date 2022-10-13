# frozen_string_literal: true

require_relative './direction'
require_relative './errors'

class Piece
  attr_reader :x, :y, :direction_facing, :color

  COLORS = %i[black white].freeze

  def initialize(start_x, start_y, start_dir, color)
    @x = start_x
    @y = start_y
    @direction_facing = Direction.new(start_dir.to_sym)
    self.color = color
  end

  def left
    @direction_facing.left!
  end

  def right
    @direction_facing.right!
  end

  def report
    "#{x}, #{y}, #{direction_facing.direction}, #{color}"
  end

  private

  def color=(color)
    color = color.to_sym
    valid_color = COLORS.include?(color)
    raise Errors::InvalidPieceColor unless valid_color

    @color = color
  end
end
