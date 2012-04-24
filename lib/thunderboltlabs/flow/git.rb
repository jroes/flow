module ThunderboltLabs
  class Flow
    class Git
      def in_repo?
        File.directory?(".git")
      end
    end
  end
end
