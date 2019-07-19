# frozen_string_literal: true

rbenv_ruby = File.read('.ruby-version').strip

set :stage, :production
server '13.231.194.111', user: 'deploy', roles: %w[app web]

set :application, 'wakuwaku'
set :repo_url, 'git@github.com:1PACVietnam/wakuwaku.git'

# Default branch is :master
set :branch, 'staging'

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, '/var/www/wakuwaku.today/public_html'

# capistrano-rails
set :rails_env, :production
set :migration_role, :web

set :assets_prefix, 'packs'
set :rails_assets_groups, :assets
# If you need to touch public/images, public/javascripts, and public/stylesheets on each deploy
set :normalize_asset_timestamps, ['public/packs']
set :keep_assets, 3

# capistrano-rbenv
set :rbenv_type, :user
set :rbenv_ruby, rbenv_ruby
# set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
# set :rbenv_map_bins, %w[rake gem bundle ruby rails puma pumactl sidekiq sidekiqctl]
# set :rbenv_roles, :all # default value

# capistrano/bundler
set :bundle_binstubs, -> { shared_path.join('bin') }
set :bundle_path, -> { shared_path.join('bundle') }
set :bundle_without, %w[development test].join(' ')
set :bundle_jobs, 4
set :bundle_flags, '--deployment --quiet'

# capistrano/puma
set :puma_user, fetch(:user)
set :puma_conf, -> { "#{shared_path}/config/puma/production.rb" }
set :puma_role, :web
set :puma_workers, 2

# capistrano/sidekiq
set :sidekiq_config, 'config/sidekiq.yml'

# Global options
# --------------
set :ssh_options, forward_agent: true
