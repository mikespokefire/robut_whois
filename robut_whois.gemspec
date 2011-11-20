# -*- encoding: utf-8 -*-
require File.expand_path('../lib/robut_whois/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Michael Smith"]
  gem.email         = ["mike@spokefire.co.uk"]
  gem.summary       = %q{Robut WHOIS plugin}
  gem.description   = %q{Robut will give you the whois information about a domain}
  gem.homepage      = ""
  
  gem.add_dependency "robut", "~> 0.3"
  gem.add_dependency "whois", "~> 2.1.0"
  gem.add_development_dependency "rspec"  
  
  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "robut_whois"
  gem.require_paths = ["lib"]
  gem.version       = RobutWhois::VERSION
end
