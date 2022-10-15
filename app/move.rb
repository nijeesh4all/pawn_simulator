require_relative './errors'

class Move
  # @param [Piece] piece
  def initialize(board, piece, to_x, to_y)
    @board = board
    @piece = piece
    @to_x = to_x
    @to_y = to_y
  end

  def execute!
    raise Errors::InvalidMoveError unless valid?

    @piece.move_to(@to_x, @to_y)
  end

  private

  def valid?
    @board.valid_space?(@to_x, @to_y) &&
      @piece.valid_move?(@to_x, @to_y)
  end
end
