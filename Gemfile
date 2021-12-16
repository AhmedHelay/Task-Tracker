# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.2'
gem 'jwt'
gem 'pg', '~> 1.2', '>= 1.2.3'
gem 'rails', '~> 6.1.4', '>= 6.1.4.1'

gem 'puma', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 5.0'

gem 'bootsnap', '>= 1.4.4', require: false
gem 'bootstrap-sass', '~> 3.3', '>= 3.3.6'

gem 'sassc-rails', '>= 2.1.0'
gem 'sass-rails', '>= 6'
gem 'simple_form'
gem 'slim-rails'

gem 'interactor'
gem 'jquery-rails'
gem 'sidekiq'

gem 'bcrypt', '~> 3.1.7'

gem 'rubocop', '~> 0.39.0'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'graphql'
  gem 'letter_opener'
  gem 'rspec-rails', '~> 5.0.0'
end

group :development do
  gem 'listen', '~> 3.3'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'spring'
  gem 'web-console', '>= 4.1.0'
end
group :test do
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

gem 'graphiql-rails', group: :development
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
