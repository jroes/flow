placeholder :arguments do
  match /.*/ do |arguments|
    arguments.split
  end
end

step "I run flow :arguments" do |arguments|
  @flow = ThunderboltLabs::Flow.new(arguments, stub_io: true)
  @flow.run!
end

step "I should see the error message :message" do |message|
  @flow.stderr.string.should include(message)
  @flow.return_code.should_not == 0
end
