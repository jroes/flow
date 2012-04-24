require_relative "flow/version"
require_relative "flow/git"

module ThunderboltLabs
  class Flow
    attr_accessor :arguments, :command, :stderr, :stdout, :stdin, :git, :return_code

    def initialize(args, opts = {})
      self.arguments   = args
      self.command     = arguments.shift
      self.git         = Git.new
      self.return_code = 0
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
      error("You are not in a git repository.") unless git.in_repo?
    end

    def error(message)
      stderr.puts(message)
      self.return_code = 1
    end
  end
end

