# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'checky/version'

Gem::Specification.new do |spec|
  spec.name          = "checky"
  spec.version       = Checky::VERSION
  spec.authors       = ["Andy Triggs"]
  spec.email         = ["andy.triggs@gmail.com"]
  spec.description   = %q{Checky is a Rack app that reports on the health of your server}
  spec.summary       = %q{Configure multiple checks and test the health of your server with an external monitoring service}
  spec.homepage      = "http://github.com/andyt/checky"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "rack"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 2.14.1"
  spec.add_development_dependency "rack-test"
end
