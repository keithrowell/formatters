# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'formatters/version'

Gem::Specification.new do |spec|
  spec.name          = "formatters"
  spec.version       = Formatters::VERSION
  spec.authors       = ["Keith Rowell"]
  spec.email         = ["keith@keithrowell.com"]
  spec.summary       = "Friendly data formatting for your Rails views."
  spec.description   = ""
  spec.homepage      = "https://github.com/keithrowell/formatters"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
