require_relative "flow/version"
require_relative "flow/git"
require_relative "flow/command"

module ThunderboltLabs
  class Flow
    attr_accessor :stderr, :stdout, :stdin, :return_code, :git

    def initialize(args, opts = {})
      @arguments    = args
      @command_name = @arguments.shift

      self.git          = Git.new
      self.return_code  = 0
      opts[:stub_io] ? stub_io : init_io
    end

    def command
      Command.from_name(@command_name).new(@arguments, self)
    end

    def run!
      command.run!
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

    def error(message)
      stderr.puts(message)
      self.return_code = 1
    end
  end
end

