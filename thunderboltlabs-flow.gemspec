# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "thunderboltlabs-flow/version"

Gem::Specification.new do |s|
  s.name        = "thunderboltlabs-flow"
  s.version     = Thunderboltlabs::Flow::VERSION
  s.authors     = ["Thunderbolt Labs"]
  s.email       = ["us@thunderboltlabs.com"]
  s.homepage    = "http://thunderboltlabs.com"
  s.summary     = %q{TODO: Write a gem summary}
  s.description = %q{TODO: Write a gem description}

  s.rubyforge_project = "thunderboltlabs-flow"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "rake"
  s.add_development_dependency "rspec"
  s.add_development_dependency "fakeweb"
  # s.add_runtime_dependency "rest-client"
end
