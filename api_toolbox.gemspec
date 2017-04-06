# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'api_toolbox/version'

Gem::Specification.new do |spec|
  spec.name          = "api_toolbox"
  spec.version       = ApiToolbox::VERSION
  spec.authors       = ["John Mason"]
  spec.email         = ["john@johnmason.io"]

  spec.summary       = %q{Handy methods to interact with CLTJRDEVS API}
  spec.description   = %q{Handy methods to interact with CLTJRDEVS API}
  spec.homepage      = "https://github.com/charlottejuniordevs/api_toolbox"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "interactor"
  spec.add_dependency "httparty"

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
