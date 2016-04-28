# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'brightpearl-ruby/version'

Gem::Specification.new do |spec|
  spec.name          = 'brightpearl-ruby'
  spec.version       = Brightpearl::VERSION
  spec.authors       = ['Simon Brook']
  spec.email         = ['simon@datanauts.co.uk']

  spec.summary       = 'Brightpearl ORM'
  spec.description   = 'Ruby wrappers for dealing with Brightpearl API'
  # Objects (contact / products etc)'
  spec.homepage      = 'http://github.com/DatanautsUK/brightpearl-ruby'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'webmock'
  spec.add_runtime_dependency 'httparty'
end
