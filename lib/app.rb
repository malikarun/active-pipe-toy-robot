# frozen_string_literal: true

require 'tty-prompt'
require_relative 'position'
require_relative 'robot'
require_relative 'base'

# App Class
class App < Base
  attr_accessor :exiting, :position

  VALIID_ACTIONS = %w[PLACE MOVE RIGHT LEFT REPORT EXIT].freeze

  def initialize
    super
    self.exiting = false
    @robots = []
  end

  def handle(cmds)
    # should be able to exit anytime
    self.exiting = true and return if cmds == 'EXIT'

    @cmds = cmds.split(':')
    # Show Format for commands
    return p 'Please enter command in format => name: action' if @cmds[1].nil?

    # Assign required variables
    find_action
    # Show info about the commands
    show_info
    # Assign a robot and it's position
    assign_robot_position
  end

  private

  def show_info
    # Show info when wrong command is entered
    return p 'Please enter a valid action' unless VALIID_ACTIONS.include?(@action)
    # Only allow 'PLACE' as first valid command
    return p 'First place the robot on board' if (@robot.nil? || @robot.position.nil?) && @action != 'PLACE'
  end

  def find_action
    # Anything before ':' is robot name
    @robot_name = @cmds[0]

    # Anything after the ':' is command
    cmd = @cmds[1].split(' ')
    @action = cmd[0].upcase
    @place_args = (cmd - [cmd[0]]).join(' ').split(',').each(&:strip!)

    # Find if the robot already exists
    @robot = @robots.find { |item| item.name == @robot_name }
  end

  def assign_robot_position
    if @robot.nil?
      @robot = Robot.new @robot_name, Position.new
      @robots << @robot
    end

    # React based on the action
    call_to_action
  end

  def call_to_action
    case @action
    when 'PLACE' then @robot.position.place(*@place_args)
    when 'MOVE' then @robot.position.move
    when 'LEFT' then @robot.position.left
    when 'RIGHT' then @robot.position.right
    when 'REPORT'
      p "#{@robot.name}: #{@robot.position.report}"
    end
  end
end
