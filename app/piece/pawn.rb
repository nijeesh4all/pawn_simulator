# frozen_string_literal: true
require_relative '../piece'

class Piece
  class Pawn < Piece
    def initialize(start_x, start_y, start_dir, color)
      super
    end

    def next_move(steps = 1)
      x_step, y_step = direction_facing.direction_vector(steps)
      [x + x_step, y + y_step]
    end

    private

    # all the direction that the pawn can move in
    def all_moves
      standard_moves + special_moves
    end

    protected

    # the pawn has two types of moves based on weather it has touched or not
    # if it hasn't been touched it can move 2 tiles as the first move
    # after that only one tile at a time
    def special_moves
      return [] if has_moved?

      [
        [x - 2, y],
        [x + 2, y],
        [x, y + 2],
        [x, y - 2]
      ]
    end

    def standard_moves
      [
        [x - 1, y],
        [x + 1, y],
        [x, y + 1],
        [x, y - 1]
      ]
    end
  end
end
