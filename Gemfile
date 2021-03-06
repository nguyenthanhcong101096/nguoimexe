# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'redis', '~> 3.0'
gem 'devise'
gem 'omniauth'
gem 'omniauth-google-oauth2'
gem 'omniauth-facebook'

gem 'shrine'
gem 'letter_avatar'
gem 'cloudinary'
gem 'mini_magick'

gem 'bugsnag'

gem 'rails', '~> 5.0.7'

gem 'puma'
gem 'figaro'
gem 'whenever'
gem 'config'

gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'

gem 'sitemap_generator'

gem 'webpacker', '~> 3.5'

gem 'active_model_serializers', '~> 0.10.0'
gem 'pg_search'

gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'pg'

gem 'rspec-rails'
gem 'factory_bot_rails'
gem 'faker'

gem 'slim-rails'
gem 'html2slim'

gem 'kaminari'
gem 'ransack'
gem 'bootstrap-kaminari-views'

gem 'counter_culture'
gem 'enumerize'
gem 'foreman'

gem 'jwt'

group :development, :test do
  gem 'pry-rails'
  gem 'pry-byebug'
  gem 'byebug', platform: :mri
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen'
  gem 'spring'
  gem 'rubocop', require: false
  gem 'rails_best_practices'

  gem 'annotate'

  gem 'spring-watcher-listen', '~> 2.0.0'

  gem 'capistrano', '~> 3.6.0', require: false
  gem 'capistrano-rails', '~> 1.1', require: false
  gem 'capistrano-rbenv', '~> 2.0', require: false
  gem 'capistrano-bundler', '~> 1.2', require: false
  gem 'capistrano3-puma', require: false
  gem 'capistrano-yarn', require: false
  gem 'capistrano-rvm'
  gem 'capistrano-passenger'
end

group :staging, :production do
  gem 'listen'
  gem 'logglier'
  gem 'lograge'
end

group :test do
  gem 'rails-controller-testing'
  gem 'rspec_junit_formatter'
  gem 'rspec-its'
  gem 'rspec-json_matcher'
  gem 'shoulda-matchers'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
