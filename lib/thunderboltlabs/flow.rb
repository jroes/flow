require_relative "flow/version"
require_relative "flow/git"
require_relative "flow/command"

module ThunderboltLabs
  class Flow
    attr_accessor :stderr, :stdout, :stdin, :return_code

    def initialize(args, opts = {})
      @arguments    = args
      @command      = command_from_name(@arguments.shift)
      @git          = Git.new
      @return_code  = 0
      opts[:stub_io] ? stub_io : init_io
    end

    def command_from_name(name)
      Command.from_name(name).new(git:       @git,
                                  arguments: @arguments,
                                  stdout:    stdout,
                                  stderr:    stderr,
                                  stdin:     stdin)
    end

    def run!
      sanity_checks
      @command.run!
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
      error("You are not in a git repository.") unless @git.in_repo?
    end

    def error(message)
      stderr.puts(message)
      self.return_code = 1
    end
  end
end

