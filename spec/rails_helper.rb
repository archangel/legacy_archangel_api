require "simplecov"

SimpleCov.start :rails do
  add_filter "install_generator.rb"
  add_filter "version.rb"

  add_group "Policies", "app/policies"
  add_group "Serializers", "app/serializers"
end

ENV["RAILS_ENV"] ||= "test"

begin
  require File.expand_path("../dummy/config/environment", __FILE__)
rescue LoadError
  puts "Could not load test application. Run `bundle exec rake dummy_app` first"
  exit
end

if Rails.env.production?
  abort("The Rails environment is running in production mode!")
end

require "spec_helper"
require "rspec/rails"

require "pry-byebug"

# Archangel support files
require "archangel/testing_support/support"
require "archangel_api/testing_support/support"

# Required factories defined in lib/archangel_api/factories.rb
require "archangel_api/factories"

# Local support files
Dir[Rails.root.join("../support/**/*.rb")].each { |f| require f }

RSpec.configure do |config|
  config.color = true
  config.mock_with :rspec

  config.raise_errors_for_deprecations!
  config.filter_rails_from_backtrace!
  config.infer_spec_type_from_file_location!
end
