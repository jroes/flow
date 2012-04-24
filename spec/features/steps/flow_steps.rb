placeholder :arguments do
  match /.*/ do |arguments|
    arguments.split
  end
end

step "I run flow :arguments" do |arguments|
  ThunderboltLabs::Flow.run!(arguments)
end
