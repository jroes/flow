class ThunderboltLabs::Flow::Command
  class Finish < self
    def initialize(*args)
      super
      sanity_checks << lambda do
        "You aren't in a feature branch." unless flow.git.on_feature_branch?
      end
    end
  end
end
