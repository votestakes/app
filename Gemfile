source 'https://rubygems.org'
ruby "2.2.2"

gem 'rails', '~>4.2'
gem 'pg'
gem 'dalli'
gem 'rails_12factor'
gem 'dotenv-rails'

# ActiveRecord
gem 'devise'

# Assets
gem 'sass-rails'
gem 'bootstrap-sass'
gem 'bootstrap-sass-extras'
gem 'jquery-rails'
gem 'compass-rails', github: 'Compass/compass-rails', branch: '2-0-stable'
gem 'coffee-rails'
gem 'uglifier'
gem 'turbolinks'

# Features
gem 'omniauth-facebook'

group :production do
  gem 'unicorn'
end

group :development do
  gem 'foreman'
  gem 'byebug'
  gem 'web-console'
  gem 'guard-rspec'
  gem 'guard-livereload'
  gem 'rack-livereload'
  gem 'guard-bundler'
  gem 'terminal-notifier'
  gem 'terminal-notifier-guard'
  gem 'thin'
  # gem 'rack-mini-profiler'
  # gem 'flamegraph'
  gem 'bullet'
  gem 'meta_request'
  gem 'quiet_assets'
end

group :test do
  gem 'rspec-rails'
  gem 'capybara'
  gem 'capybara-screenshot'
  gem 'factory_girl_rails'
  gem 'database_cleaner'
  gem 'poltergeist'
  gem 'launchy'
  gem 'spring'
end
