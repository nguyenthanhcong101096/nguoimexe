set :stage, :production
server '13.114.160.74', user: 'www', roles: %w(web app db)

set :application, "nguoimexe"
set :repo_url, "https://github.com/nguyenthanhcong101096/nguoimexe.git"

# Default branch is :master
set :branch, "master"

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/var/www/nguoimexe"

set :rails_env, :production
set :migration_role, :web

set :assets_prefix, 'static'
set :rails_assets_groups, :assets

set :normalize_asset_timestamps, ['public/static']
set :keep_assets, 3

# capistrano-rbenv
set :rbenv_type, :user
set :rbenv_ruby, rbenv_ruby
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_map_bins, %w[rake gem bundle ruby rails puma pumactl sidekiq sidekiqctl]
set :rbenv_roles, :all # default value

# capistrano/bundler
set :bundle_binstubs, -> { shared_path.join('bin') }
set :bundle_path, -> { shared_path.join('bundle') }
set :bundle_without, %w[development test].join(' ')
set :bundle_jobs, 4
set :bundle_flags, '--deployment --quiet'

# capistrano/puma
set :puma_user, fetch(:user)
set :puma_conf, -> { "#{shared_path}/config/puma.rb" }
set :puma_role, :web
set :puma_workers, 3

# Global options
# --------------
set :ssh_options, forward_agent: true
