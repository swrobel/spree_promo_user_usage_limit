# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_promo_user_usage_limit'
  s.version     = '2.4.0'
  s.summary     = 'Allow each user to use a promotion a maximum of N times'
  s.description = 'Adding this rule to a promo will allow you to set a limit on the number of completed orders for which a given user can apply it (default 1 use).'
  s.required_ruby_version = '>= 1.9.3'

  s.author    = 'Stefan Wrobel'
  s.homepage  = 'https://github.com/swrobel/spree_promo_user_usage_limit'
  s.license   = 'MIT'

  s.files       = `git ls-files`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_core', '~> 2.4.0'

  s.add_development_dependency 'factory_girl', '~> 4.4'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'rspec-rails',  '~> 2.13'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'coveralls'
end
