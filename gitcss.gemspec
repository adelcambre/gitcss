# -*- encoding: utf-8 -*-
require File.expand_path('../lib/gitcss/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Andy Delcambre", "Brian Lopez"]
  gem.email         = ["adelcambre@gmail.com", "seniorlopez@gmail.com"]
  gem.description   = %q{CSS Selectors to navigate a Git repo}
  gem.summary       = %q{This library allows you to use CSS selectors to navigate to objects in a git repo.}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "gitcss"
  gem.require_paths = ["lib"]
  gem.version       = Gitcss::VERSION

  gem.add_dependency "rugged"
  gem.add_dependency "nokogiri"
end
