# frozen_string_literal: true
require_relative '../piece'

class Piece
  class Pawn < Piece
    def initialize(start_x, start_y, start_dir, color)
      super
      @moved = false
    end

    def next_move
      x_step, y_step = direction_facing.direction_vector
      [x + x_step, y + y_step]
    end

    private

    # all the direction that the pawn can move in
    def all_moves
      [
        [x - 1, y],
        [x + 1, y],
        [x, y + 1],
        [x, y - 1]
      ]
    end
  end
end
