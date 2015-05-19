# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_discount_shipping'
  s.version     = '1.0.0'
  s.summary     = 'Shipping Discounts for Spree Commerce'
  s.description = 'Add discounts to shipping methods in Spree Commerce'
  s.required_ruby_version = '>= 1.8.7'

  s.author    = 'David Laprade'
  s.email     = 'david.laprade@gmail.com'
  s.homepage  = 'http://davidlaprade.github.io/'

  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_core', '~> 1.1'

  s.add_development_dependency 'rspec-rails', '2.12.0'
  s.add_development_dependency 'factory_girl_rails', '~> 1.7.0'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'shoulda-matchers'
  s.add_development_dependency 'ffaker'
end
