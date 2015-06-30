# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'simple_record/version'

Gem::Specification.new do |spec|
  spec.name          = "simple_record"
  spec.version       = SimpleRecord::VERSION
  spec.authors       = ["tomcat1911"]
  spec.email         = ["maslovtimofey@gmail.com"]

  spec.summary       = %q{Simple ActiveRecord implementation}
  spec.description   = %q{Simple ActiveRecord implementation}
  spec.homepage      = "https://github.com/jubileee/simple-record"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com' to prevent pushes to rubygems.org, or delete to allow pushes to any server."
  end

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_runtime_dependency "json"
end
