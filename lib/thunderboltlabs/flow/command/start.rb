class ThunderboltLabs::Flow::Command
  class Start < self
    def initialize(*args)
      super

      sanity_checks << lambda do
        "Switch to the master branch" unless flow.git.on_master?
      end

      sanity_checks << lambda do
        "There are uncommitted changes" if flow.git.uncommitted_changes?
      end
    end
  end
end
