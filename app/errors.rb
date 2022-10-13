# frozen_string_literal: true

module Errors
  class PawnSimulatorError < StandardError; end

  class InvalidDirectionError < PawnSimulatorError
    def message
      "Direction specified is invalid"
    end
  end
end
