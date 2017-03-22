$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "smtp2go/rails/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "smtp2go-rails"
  s.version     = Smtp2go::Rails::VERSION
  s.authors     = ["smtp2go"]
  s.email       = ["devs@smtp2go.com"]
  s.homepage    = "https://github.com/smtp2go-oss/smtp2go-rails"
  s.summary       = %q{Library for interfacing with smtp2go API from Rails}
  s.description   = %q{Interacts directly with smtp2go's API to facilitate sending of email from Rails.}
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "LICENSE.txt", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.0.2"
  s.add_dependency "smtp2go", "~> 0"

  s.add_development_dependency "sqlite3"
end
