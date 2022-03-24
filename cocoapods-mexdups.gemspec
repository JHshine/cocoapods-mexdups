# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cocoapods-mexdups/gem_version.rb'

Gem::Specification.new do |spec|
  spec.name          = 'cocoapods-mexdups'
  spec.version       = CocoapodsMexdups::VERSION
  spec.authors       = ['ashine']
  spec.email         = ['ashinecitic@gmail.com']
  spec.description   = %q{A short description of cocoapods-mexdups.}
  spec.summary       = %q{A longer description of cocoapods-mexdups.}
  spec.homepage      = 'https://github.com/EXAMPLE/cocoapods-mexdups'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
end
