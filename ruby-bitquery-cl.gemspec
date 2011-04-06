# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "ruby-bigquery-cl"
  s.version     = "0.2.0"
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["boo-box"]
  s.email       = ["douglas@boo-box.com"]
  s.homepage    = "http://github.com/boo-box/ruby-bigquery-cl"
  s.summary     = "Client for Google BigQuery service"
  s.description = "Client for Google BigQuery service"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency('json')

  s.add_development_dependency('rake')
  s.add_development_dependency('bundler')
end
