# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'proplog/version'

Gem::Specification.new do |spec|
  spec.name          = "proplog"
  spec.version       = Proplog::VERSION
  spec.authors       = ["Mikey Hogarth"]
  spec.email         = ["mikehogarth20@hotmail.com"]
  spec.description   = %q{Propositional Logic in Ruby}
  spec.summary       = %q{Represent, parse and evaluate propositional logic in ruby}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
