# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'good_print/version'

Gem::Specification.new do |spec|
  spec.name          = "good_print"
  spec.version       = GoodPrint::VERSION
  spec.authors       = ["Mark Dodwell"]
  spec.email         = ["mark@mkdynamic.co.uk"]
  spec.summary       = "Not as awesome as awesome_print."
  spec.description   = "Not as awesome as awesome_print. Prints objects with simple balanced indentation."
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 10.0"
end
