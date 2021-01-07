require 'rubocop/rake_task'
require 'optparse'
require_relative 'lib/app'

task default: %w[lint test]

RuboCop::RakeTask.new(:lint) do |task|
	task.patterns = ['lib/**/*.rb', 'test/**/*.rb']
	task.fail_on_error = false
end

task :run do
  file = ENV['file']
  if !file
    p "Valid commands Are PLACE, RIGHT, LEFT, MOVE, REPORT, EXIT"
    p "You can pass an option to run commands from a file like so rake run file=sample.txt"
  end

  @App = App.new

  if file
    if File.exists?(file)
      File.foreach(file) do |line|
        @App.handle line.strip unless line.strip.empty?
      end
    else
      p 'Please enter a valid file'
    end
  else
    prompt = TTY::Prompt.new
    exiting = false

    until @App.exiting
      @App.handle prompt.ask('>')
    end
  end
end

task :test do
  ruby 'test/test_robot.rb'
  ruby 'test/test_board.rb'
  ruby 'test/test_position.rb'
  ruby 'test/test_app.rb'
end