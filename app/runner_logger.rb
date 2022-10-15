# frozen_string_literal: true

require 'rainbow'

require_relative './errors'

class RunnerLogger

  def initialize(verbose: false)
    @verbose = verbose
  end

  COMMANDS = {
    'help' => 'Shows this help message',
    'place' => 'X Y F C. Places the pawn at X,Y Facing ( EAST, WEST, NORTH or SOUTH) in a color (BLACK or WHITE)',
    'move' => 'X will move the pawn one unit forward ( OR 2 if X is given as 2 ) in the direction it is currently facing.',
    'left' => 'Rotate the pawn 90 degrees in the anti clockwise direction without changing the position of the pawn.',
    'right' => 'Rotate the pawn 90 degrees in the clockwise direction without changing the position of the pawn.',
    'report' => 'Announce the X,Y,F and C of the pawn',
    'exit' => 'Exits the application.'
  }.freeze

  def info(message)
    puts Rainbow(message).blue
  end

  def error(message)
    puts Rainbow(message).red
  end

  def green(message)
    puts Rainbow(message).green
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
    command_handler_method = command_response_name(command)
    response = yield
    send(command_handler_method, response)
  rescue ArgumentError => e
    error "Invalid arguments send to #{command}\n"
    show_help_message_for(command)
  rescue Errors::PawnSimulatorError => e
    error e.message
  end

  private

  def command_response_name(command)
    "show_#{command}_command_response"
  end

  def show_place_command_response(_)
    return unless @verbose

    info 'pawn placed'
  end

  def show_move_command_response(_)
    return unless @verbose

    info 'pawn moved'
  end

  def show_left_command_response(_)
    return unless @verbose

    info 'rotated left'
  end

  def show_right_command_response(_)
    return unless @verbose

    info 'rotated right'
  end

  def show_report_command_response(response)
    green response
  end
end
