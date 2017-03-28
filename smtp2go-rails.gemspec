$:.push File.expand_path('../lib', __FILE__)

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'smtp2go-rails'
  s.version     = '0.1.1'
  s.authors     = ['smtp2go']
  s.email       = ['devs@smtp2go.com']
  s.homepage    = 'https://github.com/smtp2go-oss/smtp2go-rails'
  s.summary       = %q{Library for interfacing with smtp2go API from Ruby on Rails}
  s.description   = %q{Interacts directly with smtp2go's API to facilitate sending of email from Ruby on Rails.}
  s.license     = 'MIT'

  if s.respond_to?(:metadata)
    s.metadata['allowed_push_host'] = 'https://rubygems.org'
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  s.files = Dir['{app,config,db,lib}/**/*', 'LICENSE.txt', 'Rakefile', 'README.md']

  s.add_runtime_dependency 'rails', '~> 5.0', '>= 5.0.2'
  s.add_runtime_dependency 'smtp2go', '~> 0'

  s.add_development_dependency 'coveralls', '~> 0.8.19'
  s.add_development_dependency 'guard', '~> 2.13', '>= 2.13.0'
  s.add_development_dependency 'guard-minitest', '~> 2.4'
  s.add_development_dependency 'sqlite3', '~> 1.3'
  s.add_development_dependency 'vcr', '~> 3.0', '>= 3.0.3'
  s.add_development_dependency 'webmock', '~> 2.3', '>= 2.3.2'
end
