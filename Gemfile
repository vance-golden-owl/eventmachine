source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'
gem 'rails', '~> 7.0.4', '>= 7.0.4.2'
gem 'sprockets-rails'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'importmap-rails'
gem 'turbo-rails'
gem 'stimulus-rails'
gem 'jbuilder'
gem 'redis', '~> 4.0'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
gem 'bootsnap', require: false
gem 'slack-ruby-client'
gem 'httparty'
gem 'devise'
gem 'slim', '~> 5.1'

group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'dotenv-rails'
  gem 'pry', '~> 0.13.1'
end

group :development do
  gem 'web-console'
  gem 'rubocop', require: false
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

gem 'sidekiq', '~> 7.0'

gem 'dockerfile-rails', '>= 1.2', group: :development
