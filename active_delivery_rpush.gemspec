require_relative 'lib/active_delivery_rpush/version'

Gem::Specification.new do |spec|
  spec.name          = "active_delivery_rpush"
  spec.version       = ActiveDeliveryRpush::VERSION
  spec.authors       = ["Paul d'Hubert"]
  spec.email         = ["paul.dhubert@pm.me"]

  spec.summary       = %q{Integrates rpush notification service with active delivery}
  spec.description   = spec.summary
  spec.homepage      = "https://github.com/pauldub/active_delivery_rpush"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/pauldub/active_delivery_rpush"
  spec.metadata["changelog_uri"] = "https://github.com/pauldub/active_delivery_rpush/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.add_runtime_dependency 'rpush', '>= 5.0', '< 5.3'
  spec.add_runtime_dependency 'active_delivery', '>= 0.3.1', '< 0.5.0'
  spec.add_runtime_dependency 'abstract_notifier', '>= 0.2', '< 0.4'
end
