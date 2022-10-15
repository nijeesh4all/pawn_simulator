# frozen_string_literal: true

module Errors
  class PawnSimulatorError < StandardError; end

  # error when there exists no such direction as given
  class InvalidDirectionError < PawnSimulatorError
    def message
      'Direction specified is invalid'
    end
  end

  # error when the piece color given is invalid
  class InvalidPieceColor < PawnSimulatorError
    def message
      'invalid piece color given it should be either black or white'
    end
  end

  # when the move is invalid
  class InvalidMoveError < PawnSimulatorError
    def message
      'invalid move'
    end
  end

  class CantPlacePieceError < PawnSimulatorError
    def message
      'cant place the piece at location given'
    end
  end

  class PawnIsNotPlacedError < PawnSimulatorError
    def message
      "the pawn hasn't been placed in the board."
    end
  end
end
