# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "dogecoin/version"

Gem::Specification.new do |s|
  s.licenses    = [ 'MIT' ]
  s.name        = "dogecoin-client"
  s.version     = Dogecoin::VERSION
  s.authors     = ["Anthony Eufemio"]
  s.email       = ["tymat@pris.im"]
  s.homepage    = "http://github.com/tymat/dogecoin-client"
  s.summary     = %q{Provides a Ruby library to the complete Dogecoin JSON-RPC API.}
  s.description = "Provides a Ruby library to the complete Dogecoin JSON-RPC API. "

  s.rubyforge_project = "dogecoin-client"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "rake",    '~> 0.9'
  s.add_development_dependency "bundler"
  s.add_development_dependency "rspec",   '~> 2.6'
  s.add_development_dependency "fakeweb", '~> 1.3'
  s.add_development_dependency "coveralls"
  s.add_runtime_dependency "rest-client"
end
