# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'first_and_only/version'

Gem::Specification.new do |spec|
  spec.name          = "first_and_only"
  spec.version       = FirstAndOnly::VERSION
  spec.authors       = ["Mark Lorenz"]
  spec.email         = ["markjlorenz@dapplebeforedawn.com"]
  spec.description   = <<-DESCR
Get the first element from an enumerable, and assert that there is only one element to take.
  DESCR
  spec.summary       = <<-SUMMARY
```
[:just_one].first_and_only!  # => :just_one
```

```
[].first_and_only!  # =>  0 (Enumerable::FirstAndOnly::LengthNotOne)
```

```
[:one, :and_two].first_and_only!  # => 2 (Enumerable::FirstAndOnly::LengthNotOne)
```
  SUMMARY
  spec.homepage      = "https://github.com/dapplebeforedawn/first-and-only-gem"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
