# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'i_just_want_a_free_vacuum_in_the_boulder_area/version'

Gem::Specification.new do |spec|
  spec.name          = "i_just_want_a_free_vacuum_in_the_boulder_area"
  spec.version       = IJustWantAFreeVacuumInTheBoulderArea::VERSION
  spec.authors       = ["Eric Thomas"]
  spec.email         = ["eric.l.m.thomas@gmail.com"]
  spec.description   = %q{TODO: Write a gem description}
  spec.summary       = %q{TODO: Write a gem summary}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "vcr", '~> 2.5.0'
  spec.add_development_dependency "webmock", '~> 1.13.0'

  spec.add_dependency 'craigslist'
end
