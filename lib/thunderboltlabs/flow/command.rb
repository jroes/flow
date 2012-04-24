class ThunderboltLabs::Flow::Command
  def self.from_name(name)
    {
      start:  Start,
      finish: Finish
    }[name.to_sym] 
  end

  def initialize(opts = {})
    @opts = opts
  end

  def run!
    sanity_checks
    run_command
    puts "Running with #{@opts.inspect}"
  end

  def sanity_checks
  end

  def run_command
    raise "Implement this in your base class"
  end
end

require_relative "command/start"
require_relative "command/finish"
