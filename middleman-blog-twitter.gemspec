# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'middleman/blog/twitter/version'

Gem::Specification.new do |spec|
  spec.name          = 'middleman-blog-twitter'
  spec.version       = Middleman::Blog::Twitter::VERSION
  spec.authors       = ['Michiaki Mizoguchi']
  spec.email         = ['michiaki.mizoguchi@gmail.com']
  spec.summary       = %q{Tweet about the articles on Middleman blog}
  spec.description   = %q{Tweet about the articles on Middleman blog}
  spec.homepage      = 'https://github.com/mizoguche/middleman-blog-twitter'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split("\n")
  spec.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  spec.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency('middleman-core', ['>= 4.1.9'])
  spec.add_runtime_dependency('middleman-cli')
  spec.add_runtime_dependency('middleman-blog', '~> 4.0.1')
  spec.add_runtime_dependency('twitter', '~> 5.13')
  spec.add_runtime_dependency('thor', ['>= 0.17.0', '< 2.0'])

  spec.add_development_dependency('bundler', '~> 1.5')
  spec.add_development_dependency('rake')
  spec.add_development_dependency('rspec')
  spec.add_development_dependency('cucumber')
  spec.add_development_dependency('aruba')
  spec.add_development_dependency('rdoc')
  spec.add_development_dependency('yard')
end
