source 'https://rubygems.org'

gem 'rails', '4.2.5'
gem 'pg', '~> 0.15'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'puma'
gem 'monban'
gem 'monban-generators'
gem 'neat'
gem 'figaro'
gem 'omniauth'
gem 'bootstrap-sass', '~> 3.3.6'

# Fork of omniauth-twitch; Gem owners have yet to merge this person's
# pull request.
gem 'omniauth-twitch', 
  :git => "https://github.com/jtokoph/omniauth-twitch.git", 
  :branch => "jtokoph-patch-1"

gem 'cancancan', '~> 1.10'

gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc

group :development, :test do
  gem 'byebug'
  gem 'database_cleaner'
  gem 'cucumber-rails', :require => false
  gem 'pry'
  gem 'factory_girl_rails'
end

group :development do
  gem 'web-console', '~> 2.0'
  gem 'spring'
  gem 'refills'
end

group :test do
  gem 'rspec-rails'
  gem 'capybara'
  gem 'faker'
end

