# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = "kagaribi"
  spec.version       = "0.1.0"
  spec.authors       = ["mizphses"]
  spec.email         = ["info@gentoo.app"]

  spec.summary       = "My blog template"
  spec.homepage      = "https://example.com"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").select { |f| f.match(%r!^(assets|_layouts|_includes|_sass|LICENSE|README|_config\.yml)!i) }

  spec.add_runtime_dependency "jekyll", "~> 4.1"
end
