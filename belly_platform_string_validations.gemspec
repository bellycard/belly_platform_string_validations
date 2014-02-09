# coding: utf-8
require File.expand_path('../lib/belly_platform_string_validations/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Darby Frey"]
  gem.email         = ["darby@bellycard.com"]
  gem.description   = %q{Common string functionality for the BellyPlatform}
  gem.summary       = %q{Common string functionality for the BellyPlatform}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "belly_platform_string_validations"
  gem.require_paths = ["lib"]
  gem.version       = BellyPlatformStringValidations::VERSION

  gem.add_dependency 'rake'
  gem.add_dependency 'octokit'
  gem.add_dependency 'activesupport'

  gem.add_development_dependency "rspec"
  gem.add_development_dependency "pry"
  gem.add_development_dependency "git"
end
