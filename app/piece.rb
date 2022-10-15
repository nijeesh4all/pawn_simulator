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
    @moved = false
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

  # @param [Integer] x
  # @param [Integer] y
  def valid_move?(x, y)
    possible_moves
      .any? { |possible_x, possible_y| possible_x == x && possible_y == y }
  end

  # @param [Object] x
  # @param [Object] y
  def move_to(x, y)
    @x = x
    @y = y
    @moved = true
  end

  def has_moved?
    @moved
  end

  private

  # removes any obvious invalid moves like negative values
  def possible_moves
    all_moves.filter { |x, y| x >= 0 && y >= 0 }
  end

  def color=(color)
    color = color.to_sym
    valid_color = COLORS.include?(color)
    raise Errors::InvalidPieceColor unless valid_color

    @color = color
  end
end
