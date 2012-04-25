module ThunderboltLabs
  class Flow
    class Git
      def in_repo?
        File.directory?(".git")
      end

      def on_master?
        branch_name == "master"
      end

      def on_feature_branch?
        not on_master?
      end

      def branch_name
        ref.split('/').last
      end

      def ref
        git("symbolic-ref -q HEAD")
      end

      def git(args)
        `git #{args}`.strip
      end

      def status
        git("status")
      end

      def uncommitted_changes?
        true
      end
    end
  end
end
