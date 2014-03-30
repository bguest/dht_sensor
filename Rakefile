require "bundler/gem_tasks"
require "rake/extensiontask"
require 'rspec/core/rake_task'

Rake::ExtensionTask.new 'dht_sensor' do |ext|
  ext.lib_dir = "lib/dht_sensor"
end

RSpec::Core::RakeTask.new(:spec)
task :default => :spec
