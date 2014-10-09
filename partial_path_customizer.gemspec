$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "partial_path_customizer/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "partial_path_customizer"
  s.version     = PartialPathCustomizer::VERSION
  s.authors     = ["Aaron Renner"]
  s.email       = ["aaron@animascodelabs.com"]
  s.homepage    = "https://github.com/AnimasCodeLabs/partial_path_customizer"
  s.summary     = "Easily override #to_partial_path on Rails models"
  s.description = "Easily override #to_partial_path on Rails models"
  s.license     = "MIT"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_dependency 'dumb_delegator', '~> 0.6'

  s.add_development_dependency "appraisal"
  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails", "~> 3.0"
  s.add_development_dependency "rspec-activemodel-mocks"
  s.add_development_dependency "pry"
end
