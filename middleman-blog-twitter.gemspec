# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'middleman/blog/twitter/version'

Gem::Specification.new do |spec|
  spec.name          = "middleman-blog-twitter"
  spec.version       = Middleman::Blog::Twitter::VERSION
  spec.authors       = ["Michiaki Mizoguchi"]
  spec.email         = ["michiaki.mizoguchi@gmail.com"]
  spec.summary       = %q{Tweet about the articles on Middleman blog}
  spec.description   = %q{Tweet about the articles on Middleman blog}
  spec.homepage      = "https://github.com/mizoguche/middleman-blog-twitter"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "middleman-blog", "~> 3.5"
  spec.add_runtime_dependency "twitter", "~> 5.13"

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
