module ThunderboltLabs
  class Flow
    class Git
      def in_repo?
        File.directory?(".git")
      end

      def on_master?
        false
      end

      def on_feature_branch?
        false
      end
    end
  end
end
