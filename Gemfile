source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'redis'
gem 'devise'
gem 'omniauth-google-oauth2'

gem 'authy'

gem 'shrine'
gem 'letter_avatar'

gem 'rails', '~> 5.0.7'

gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'

gem 'webpacker', '~> 3.5'
gem 'react-rails'

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

gem 'activeadmin'
gem 'enumerize'

group :development, :test do
  gem 'pry-rails'
  gem 'pry-byebug'
  gem 'pry-coolline'
  gem 'byebug', platform: :mri
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'bugsnag'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'sqlite3'
end

group :staging, :production do
  gem 'logglier'
  gem 'bugsnag'
  gem 'lograge'
  gem 'pg'
end
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
