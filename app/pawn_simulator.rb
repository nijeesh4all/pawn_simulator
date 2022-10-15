require_relative '../app/runner_logger'
require_relative '../app/pawn_simulator_sdt_in_adapter'

require 'byebug'

class PawnSimulator

  def run
    @live = true
    @logger = RunnerLogger.new
    @adapter = PawnSimulatorSdtInAdapter.new

    @logger.info 'Type `help` for instructions on usage'

    while @live
      print '> '
      input = gets.chomp.downcase.split(/\s+/)
      command, *arguments = input
      case command
      when 'help'
        @logger.show_help_message
      when 'exit'
        exit
      when *RunnerLogger::COMMANDS.keys
        @logger.handle_command_response(command) do
          @adapter.public_send(command, *arguments)
        end
      else
        @logger.show_unrecognized_message
      end
    end
  end

  private

  def exit
    @logger.info 'Thank you for using simple_warehouse!'
    @live = false
  end

end
