# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dht_sensor/version'

Gem::Specification.new do |spec|
  spec.name          = "dht_sensor"
  spec.version       = DhtSensor::VERSION
  spec.authors       = ["Benjamin Guest"]
  spec.email         = ["benguest@gmail.com"]
  spec.summary       = %q{Ruby C extension to use the DHT-XX type humidity/temperature sensors}
  spec.description   = %q{Ruby C extension to access temperature and humidity reading taken by the DHT-XX type sensors, see (http://www.adafruit.com/products/385)}
  spec.homepage      = "http://github.com/bguest/dht_sensor"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  spec.extensions = %w[ext/dht_sensor/extconf.rb]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake-compiler", "~> 0.9.2"
  spec.add_development_dependency "rspec",     "~> 2.14"
  spec.add_development_dependency 'mocha',     "~> 1.0"
  spec.add_development_dependency "simplecov", "~> 0.8.2"
  spec.add_development_dependency "rake",      "~> 10.2"
end
