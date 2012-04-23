ENV["RACK_ENV"] = "test"

require "bundler/setup"
require 'rspec'
require 'fakeweb'

require "thunderboltlabs-flow.rb"

FakeWeb.allow_net_connect = false

def create_dirs
  # mkdir(Capybara.app.settings.views)
  # mkdir(Capybara.app.settings.public_folder)
  # mkdir(Capybara.app.settings.data_root)
end

def remove_dirs
  # rmdir(Capybara.app.settings.root)
end

def mkdir(dir)
  FileUtils.mkdir_p(dir)
end

def rmdir(dir)
  FileUtils.rm_rf(dir)
end

RSpec.configure do |config|
  config.before(:suite) { create_dirs }
  config.after(:suite)  { remove_dirs }

  config.before(:each) do
    remove_dirs
    create_dirs
  end
end

