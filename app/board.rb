# frozen_string_literal: true

class Board
  attr_reader :columns, :rows

  # @param [Integer] columns
  # @param [Integer] rows
  def initialize(columns = 8, rows = 8)
    @columns = columns
    @rows = rows
    @pieces = []
  end

  def place_piece(piece)
    raise Errors::CantPlacePieceError unless valid_space?(piece.x, piece.y)

    @pieces.push(piece)
  end

  # @param [Integer] x
  # @param [Integer] y
  def valid_space?(x, y)
    x < @columns && y < @columns &&
      x > -1 && y > -1
  end
end
