require 'rainbow'

require_relative './errors'

class RunnerLogger

  COMMANDS = {
    'HELP' => 'Shows this help message',
    'PLACE' => 'X Y F C. Places the pawn at X,Y Facing ( EAST, WEST, NORTH or SOUTH) in a color (BLACK or WHITE)',
    'MOVE' => 'X will move the pawn one unit forward ( OR 2 if X is given as 2 ) in the direction it is currently facing.',
    'LEFT' => 'Rotate the pawn 90 degrees in the anti clockwise direction without changing the position of the pawn.',
    'RIGHT' => 'Rotate the pawn 90 degrees in the clockwise direction without changing the position of the pawn.',
    'REPORT' => 'Announce the X,Y,F and C of the pawn',
    'EXIT' => 'Exits the application.'
  }.freeze

  def info(message)
    puts Rainbow(message).blue
  end

  def error(message)
    puts Rainbow(message).red
  end

  def show_unrecognized_message
    error 'Command not found. Type `help` for instructions on usage'
  end

  def show_help_message_for(command)
    info command.upcase.ljust(10) + COMMANDS[command]
  end

  def show_help_message
    COMMANDS.each_key { |command| show_help_message_for(command) }
  end

  def handle_command_response(command)
    puts yield
  rescue ArgumentError => e
    error "Invalid arguments send to #{command}\n"
    show_help_message_for(command)
  rescue Errors::PawnSimulatorError => e
    error e.message
  end

end
