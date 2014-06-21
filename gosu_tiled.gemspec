# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gosu_tiled/version'

Gem::Specification.new do |spec|
  spec.name          = 'gosu_tiled'
  spec.version       = Gosu::Tiled::VERSION
  spec.authors       = ['Tomas Varaneckas']
  spec.email         = ['tomas.varaneckas@gmail.com']
  spec.summary       = %q{Tiled map editor integration for Gosu game engine}
  spec.description   = %q{Makes it easy to load tile maps built with Tiled editor into Gosu games}
  spec.homepage      = 'https://github.com/spajus/gosu-tiled'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(/\.(gif|png)$/) }
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'gosu'
  spec.add_dependency 'json'

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec', '~> 3.0.0'
  spec.add_development_dependency 'guard-rspec'
end
