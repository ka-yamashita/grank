# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'grank/version'

Gem::Specification.new do |spec|
  spec.name          = "grank"
  spec.version       = Grank::VERSION
  spec.authors       = ["kazuhiko yamashita"]
  spec.email         = ["wwww.kazu.com@gmail.com"]

  spec.summary       = %q{get google pagerank}
  spec.description   = %q{get google pagerank}
  spec.homepage      = "http://ten-snapon.com"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
end
