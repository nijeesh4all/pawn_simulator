# frozen_string_literal: true

module Errors
  class PawnSimulatorError < StandardError; end

  # error when there exists no such direction as given
  class InvalidDirectionError < PawnSimulatorError
    def message
      'Direction specified is invalid'
    end
  end
end
