lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rspec_api_docs/version'

Gem::Specification.new do |spec|
  spec.name = 'rspec-api-docs'
  spec.version = RspecApiDocs::VERSION
  spec.authors = ['Odin Dutton']
  spec.email = ['odindutton@gmail.com']

  spec.summary = 'Generate API documentation using RSpec'
  spec.homepage = 'https://github.com/twe4ked'
  spec.license = 'MIT'

  spec.files = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^spec/}) }
  spec.bindir = 'bin'
  spec.executables = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'base64'
  spec.add_development_dependency 'bundler', '~> 2.6.9'
  spec.add_development_dependency 'rake', '~> 13.3'
  spec.add_development_dependency 'rspec', '~> 3.13'
  spec.add_development_dependency 'logger'
  spec.add_development_dependency 'ostruct'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rack-test'
  spec.add_development_dependency 'sinatra', '~> 4.1'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'rubocop-rake'
  spec.add_development_dependency 'rubocop-rspec'
end
