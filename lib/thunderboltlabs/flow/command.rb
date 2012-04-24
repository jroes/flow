class ThunderboltLabs::Flow::Command
  attr_accessor :flow, :arguments
  def self.from_name(name)
    {
      start:  Start,
      finish: Finish
    }[name.to_sym] 
  end

  def initialize(args, flow)
    self.arguments = args
    self.flow = flow
  end

  def run!
    sanity_checks
    run_command
  end

  def sanity_checks
    unless flow.git.in_repo?
      flow.error("You are not in a git repository.")
    end
  end

  def run_command
  end
end

require_relative "command/start"
require_relative "command/finish"
