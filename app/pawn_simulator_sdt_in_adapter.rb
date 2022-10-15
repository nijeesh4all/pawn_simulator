# frozen_string_literal: true

require_relative './errors'
require_relative './board'
require_relative './piece/pawn'
require_relative './move'

class PawnSimulatorSdtInAdapter
  def initialize
    @placed = false
    @pawn = nil
  end

  def place(x, y, direction_facing, color)
    # since per the requirement we are placing only one pawn
    # so its easier to clear the board than re-initing the array
    @board = Board.new
    @pawn = Piece::Pawn.new(x.to_i, y.to_i, direction_facing.to_sym, color.to_sym)
    @board.place_piece(@pawn)
    @placed = true
  end

  def move(steps = 1)
    raise Errors::PawnIsNotPlacedError unless @placed

    next_move_x, next_move_y = @pawn.next_move(steps.to_i)
    move = Move.new(@board, @pawn, next_move_x, next_move_y)
    move.execute!
  end

  def left
    raise Errors::PawnIsNotPlacedError unless @placed

    @pawn.left
  end

  def right
    raise Errors::PawnIsNotPlacedError unless @placed

    @pawn.right
  end

  def report
    raise Errors::PawnIsNotPlacedError unless @placed

    @pawn.report
  end
end