class ThunderboltLabs::Flow::Command
  class Finish < self
    def sanity_checks
      super
      unless flow.git.on_feature_branch?
        flow.error("You aren't in a feature branch.")
      end
    end
  end
end
