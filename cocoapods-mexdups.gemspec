# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cocoapods-mexdups/gem_version.rb'

Gem::Specification.new do |spec|
  spec.name          = 'cocoapods-mexdups'
  spec.version       = CocoapodsMexdups::VERSION
  spec.authors       = ['ashine']
  spec.email         = ['ashinecitic@gmail.com']
  spec.description   = '指定Pod目录和壳工程目录,搜索并移除壳工程目录已存在的重复文件'
  spec.summary       = '根据pod组件移除壳工程中的重复文件,先输入pod文件夹，再输入工程文件夹'
  spec.homepage      = 'https://github.com/JHshine/cocoapods-mexdups'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']
  spec.add_development_dependency 'cocoapods', '>= 1.1.1', '< 2.0'
  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
end
