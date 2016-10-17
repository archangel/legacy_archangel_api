$:.push File.expand_path("../lib", __FILE__)

require "archangel_api/version"

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = "archangel_api"
  s.version     = ArchangelApi::VERSION
  s.authors     = ["David Freerksen"]
  s.homepage    = "https://github.com/archangel/archangel_api"
  s.summary     = "Summary of ArchangelApi."
  s.description = "Description of ArchangelApi."
  s.license     = "MIT"

  s.files       = `git ls-files`.split($\)

  s.required_ruby_version = ">= 2.2.2"

  s.add_dependency "archangel", "~> 0.0.1"

  s.add_dependency "active_model_serializers", "~> 0.10.0"
  s.add_dependency "deface", "~> 1.0.2"
end
