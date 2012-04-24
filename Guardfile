guard 'rspec', version: 2, cli: File.read(".rspec").delete("\n") do
  watch(%r{^spec/.+_spec\.rb$})
  watch('spec/spec_helper.rb') { "spec" }
  watch(".rspec")              { "spec" }
  watch(%r{^config/})          { "spec" }
  watch(%r{^lib/})             { "spec" }
  watch("Gemfile.lock")        { "spec" }
end

guard 'bundler', :cli => '--binstubs .bin' do
  watch('Gemfile')
  watch(/^.+\.gemspec/)
end
