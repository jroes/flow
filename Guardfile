# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard 'rspec', :version => 2, :cli => File.read(".rspec") do
  watch(%r{^spec/.+_spec\.rb$})

  watch('spec/spec_helper.rb') { "spec" }
  watch(".rspec")              { "spec" }
  watch(%r{^config/})          { "spec" }
  watch(%r{^lib/})             { "spec" }
  watch("Guardfile")           { "spec" }
  watch("Gemfile.lock")        { "spec" }
end

guard 'bundler' do
  watch('Gemfile')
  watch(/^.+\\.gemspec/)
end
