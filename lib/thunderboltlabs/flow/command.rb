require 'active_support/core_ext/module/attribute_accessors'

class ThunderboltLabs::Flow::Command
  def self.from_name(name)
    {
      start:  Start,
      finish: Finish
    }[name.to_sym] 
  end

  attr_accessor :flow, :arguments, :sanity_checks

  def initialize(args, flow)
    self.arguments = args
    self.flow = flow
    self.sanity_checks = []

    sanity_checks << lambda do
      "You are not in a git repository." unless flow.git.in_repo?
    end
  end

  def run!
    check_sanity
    run_command
  end

  def run_command
    # implemented by subclasses
  end

  def check_sanity
    sanity_checks.detect do |check|
      if message = check.call
        flow.error(message)
      end
    end
  end
end

require_relative "command/start"
require_relative "command/finish"
