# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "thunderboltlabs/flow/version"

Gem::Specification.new do |s|
  s.name        = "thunderboltlabs-flow"
  s.version     = ThunderboltLabs::Flow::VERSION
  s.authors     = ["Thunderbolt Labs"]
  s.email       = ["us@thunderboltlabs.com"]
  s.homepage    = "http://thunderboltlabs.com"
  s.summary     = %q{TODO: Write a gem summary}
  s.description = %q{TODO: Write a gem description}

  s.rubyforge_project = "thunderboltlabs-flow"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- spec/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "active_support"
  s.add_development_dependency "rake"
  s.add_development_dependency "rspec"
  s.add_development_dependency "fakeweb"
  s.add_development_dependency "guard"
  s.add_development_dependency "guard-rspec"
  s.add_development_dependency "guard-bundler"
  s.add_development_dependency "yard"
  s.add_development_dependency 'ruby_gntp'
  s.add_development_dependency 'turnip'
end
