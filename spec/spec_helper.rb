ENV["RACK_ENV"] = "test"

require "bundler/setup"
require 'rspec'
require 'turnip'
require 'fakeweb'

require "thunderboltlabs/flow"

Turnip.step_dirs = ['spec/features']

FakeWeb.allow_net_connect = false

REPOSITORY_DIRECTORY = "/tmp/flow-specs-#{Process.pid}"
CURRENT_DIRECTORY = Dir.pwd

def create_dirs
  FileUtils.mkdir_p(REPOSITORY_DIRECTORY)
end

def remove_dirs
  FileUtils.rm_rf(REPOSITORY_DIRECTORY)
end

def git(command)
  system "git #{command} > #{CURRENT_DIRECTORY}/log/test.log 2>&1"
end

RSpec.configure do |config|
  config.before(:suite) { create_dirs }
  config.after(:suite)  { remove_dirs }

  config.before(:each) do
    remove_dirs
    create_dirs
  end

  config.after(:each) { FileUtils.cd(CURRENT_DIRECTORY) }
end

