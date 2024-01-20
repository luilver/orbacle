# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = 'orbacle'
  spec.version       = '0.2.1'
  spec.licenses      = ['MIT']
  spec.authors       = ['Rafał Łasocha']
  spec.email         = 'orbacle@swistak35.com'

  spec.summary       = 'Static analysis for Ruby'
  spec.description   = <<DESC
  Language server using engine allowing for smart jump-to-definitions,
  understanding metaprogramming definitions, refactoring and more.
DESC
  spec.homepage      = 'https://github.com/swistak35/orbacle'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features|script)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
  spec.required_ruby_version = '~> 2.7.0'
  spec.add_dependency 'lsp-protocol', '= 0.0.7'
  spec.add_dependency 'parser', '~> 2.6.0'
  spec.add_dependency 'priority_queue_cxx'
  spec.add_dependency 'rgl', '~> 0.5.3'
  spec.add_dependency 'rubytree', '~> 0.9.7'
  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'byebug'
  spec.add_development_dependency 'hash_diff', '~> 0.6.2'
  spec.add_development_dependency 'rspec'
end
