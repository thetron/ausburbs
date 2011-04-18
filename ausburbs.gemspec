# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "ausburbs/version"

Gem::Specification.new do |s|
  s.name        = "ausburbs"
  s.version     = Ausburbs::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Nicholas Bruning"]
  s.email       = ["nicholas@bruning.com.au"]
  s.homepage    = "https://github.com/thetron/ausburbs"
  s.summary     = %q{Provides Australian suburbs data including latitudes and longitudes.}
  s.description = %q{A simple gem for accesssing basic data about suburbs across Australia, including latitudes and longitudes}

  s.rubyforge_project = "ausburbs"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
