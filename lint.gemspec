lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lint/version'

Gem::Specification.new do |spec|
  spec.name          = 'lint'
  spec.version       = Lint::VERSION
  spec.authors       = ['Matthias Siegel']
  spec.email         = ['matthias.siegel@gmail.com']
  spec.summary       = %q{A collection of code linters.}
  spec.description   = %q{A collection of code linters and opinionated config files.}
  spec.homepage      = 'https://github.com/choc/lint'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.test_files    = spec.files.grep(%r{^(spec)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'coffeelint'
  spec.add_dependency 'rubocop'
  spec.add_dependency 'rubocop-rspec'
  spec.add_dependency 'scss_lint'

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
end
