# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'unrest/version'

Gem::Specification.new do |spec|
  spec.name          = "unrest"
  spec.version       = Unrest::VERSION
  spec.authors       = ["Perry Hertler"]
  spec.email         = ["perry@hertler.org"]
  spec.summary     = %q{Restful Plain Old Ruby Objects.}
  spec.description = %q{Restful Plain Old Ruby Objects.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.1'
  spec.add_development_dependency 'rspec-its', '~> 1.1'
  spec.add_development_dependency 'pry-nav'
  spec.add_development_dependency 'webmock'

  spec.add_dependency 'httparty'
  spec.add_dependency 'hashie'
  spec.add_dependency 'activesupport'
end
