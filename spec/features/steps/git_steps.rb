placeholder :branch_name do
  match /.*/ do |name|
    name
  end
end

step "I'm in a normal directory" do
  FileUtils.cd(REPOSITORY_DIRECTORY)
end

step "I'm in a git repo" do
  step "I'm in a normal directory"
  git("init")
  system "touch me"
  git("add me")
  git("commit -m 'first post'")
end

step "I'm on the :branch_name branch" do |branch_name|
  if branch_name == "master"
    git("checkout #{branch_name}")
  else
    git("checkout -b #{branch_name}")
  end
end

step "there are unstaged changes" do
  system "echo 'foo' > me"
end

step "there are uncommitted changes" do
  system "echo 'foo' > me"
  git("add me")
end
