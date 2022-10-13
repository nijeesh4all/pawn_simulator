require_relative '../app/runner_logger'

class PawnSimulator

  def run
    @live = true
    @logger = RunnerLogger.new

    @logger.info 'Type `help` for instructions on usage'

    while @live
      print '> '
      input = gets.chomp.split(/\s+/)
      command, *arguments = input

      case command
      when 'help'
        @logger.show_help_message
      when 'exit'
        exit
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
