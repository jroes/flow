class ThunderboltLabs::Flow::Command
  class Start < self
    def sanity_checks
      super
      flow.error("Switch to the master branch") unless flow.git.on_master?
    end
  end
end
