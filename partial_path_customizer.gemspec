$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "partial_path_customizer/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "partial_path_customizer"
  s.version     = PartialPathCustomizer::VERSION
  s.authors     = ["Aaron Renner"]
  s.email       = ["aaron@animascodelabs.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of PartialPathCustomizer."
  s.description = "TODO: Description of PartialPathCustomizer."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.1.6"
  s.add_dependency 'dumb_delegator', '>= 0.6.0'

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "rspec-activemodel-mocks"
  s.add_development_dependency "pry"
end
