module ThunderboltLabs
  class Flow
    attr_accessor :arguments, :command, :stderr, :stdout, :stdin

    def initialize(args, opts = {})
      self.arguments = args
      self.command   = arguments.shift
      opts[:stub_io] ? stub_io : init_io
    end

    def run!
      sanity_checks

      stdout.puts "Running #{arguments}"
      stderr.puts "foo"
    end

    def stub_io
      self.stdin  = StringIO.new
      self.stderr = StringIO.new
      self.stdout = StringIO.new
    end

    def init_io
      self.stdin  = $stdin
      self.stderr = $stderr
      self.stdout = $stdout
    end

    def sanity_checks
      error("You are not in a git reposibory.") unless in_git_repo?
    end
  end
end

require_relative "flow/version"

