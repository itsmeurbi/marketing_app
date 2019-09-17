# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

gem 'administrate', git: 'https://github.com/thoughtbot/administrate.git'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'bulma-rails'
gem 'devise'
gem 'devise_invitable', '~> 2.0.0'
gem 'haml-rails', '~> 2.0'
gem 'jbuilder', '~> 2.7'
gem 'pg'
gem 'puma', '~> 3.11'
gem 'rails', '~> 6.0.0'
gem 'role_model'
gem 'sass-rails', '~> 5'
gem 'scss_lint', require: false
gem 'simple_form'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 4.0'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
end

group :development do
  gem 'letter_opener'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'rubocop', require: false
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
