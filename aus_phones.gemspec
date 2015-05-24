# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'aus_phones/version'

Gem::Specification.new do |spec|
  spec.name          = 'aus_phones'
  spec.version       = AusPhones::VERSION
  spec.authors       = ['bevans157']
  spec.email         = ['ben.s.evans@gmail.com']
  spec.summary       = 'Australian phone number validator'
  spec.description   = 'AusPhones validates and identifies Australian phone numbers by region and type (mobile, land-line etc) '
  spec.homepage      = 'https://github.com/bevans157/aus_phone'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'activesupport', '~> 4.2'

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'awesome_print', '~> 0.0'
  spec.add_development_dependency 'rspec', '~> 3.0'

end
