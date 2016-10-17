begin
  require "bundler/setup"
rescue LoadError
  puts "You must `gem install bundler` and `bundle install` to run rake tasks"
end

Dir.glob("./lib/tasks/**/*_tasks.rake").each { |r| load r }

Bundler::GemHelper.install_tasks

require "bundler/gem_tasks"
require "rspec/core/rake_task"

require "archangel/testing_support/rake/dummy_rake"

RSpec::Core::RakeTask.new

task default: :spec

desc "Generates a dummy app for testing"
task :dummy_app do
  ENV["LIB_NAME"] = "archangel_api"

  Rake::Task["dummy:generate"].invoke
end
