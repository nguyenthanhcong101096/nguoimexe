# config valid for current version and patch releases of Capistrano
rvm_ruby = File.read('.ruby-version').strip
lock "~> 3.11.0"

# config valid only for current version of Capistrano

set :application, 'nguoimexe'
set :repo_url, 'git@github.com:nguyenthanhcong101096/nguoimexe.git'
set :branch, :master
set :deploy_to, '/home/deploy/nguoimexe'
set :pty, true
set :linked_files, %w{config/database.yml config/application.yml}
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system public/uploads}
set :keep_releases, 5
set :rvm_type, :user
set :rvm_ruby_version, rvm_ruby

# capistrano/bundler
set :bundle_binstubs, -> { shared_path.join('bin') }
set :bundle_path, -> { shared_path.join('bundle') }
set :bundle_without, %w[development test].join(' ')
set :bundle_jobs, 4
set :bundle_flags, '--deployment --quiet'


set :puma_rackup, -> { File.join(current_path, 'config.ru') }
set :puma_state, "#{shared_path}/tmp/pids/puma.state"
set :puma_pid, "#{shared_path}/tmp/pids/puma.pid"
set :puma_bind, "unix://#{shared_path}/tmp/sockets/puma.sock"    #accept array for multi-bind
set :puma_conf, "#{shared_path}/puma.rb"
set :puma_access_log, "#{shared_path}/log/puma_error.log"
set :puma_error_log, "#{shared_path}/log/puma_access.log"
set :puma_role, :app
set :puma_env, fetch(:rack_env, fetch(:rails_env, 'production'))
set :puma_threads, [0, 8]
set :puma_workers, 0
set :puma_worker_timeout, nil
set :puma_init_active_record, true
set :puma_preload_app, false

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, '/var/www/my_app_name'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: 'log/capistrano.log', color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')

# Default value for linked_dirs is []
# set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

namespace :yarn do
  desc 'Install npm packages'
  task :install do
    on roles(:app) do
      execute :yarn, :install
    end
  end
end

namespace :deploy do
  desc 'Upload yml file.'
  task :upload_yml do
    on roles(:app) do
      execute "mkdir -p #{shared_path}/config/puma"
      execute "mkdir -p #{shared_path}/node_modules"
      upload!('config/database.yml', "#{shared_path}/config/database.yml")
      upload!('config/secrets.yml', "#{shared_path}/config/secrets.yml")
    end
  end
  
  desc 'Seed the database.'
  task :seed_db do
    on roles(:app) do
      within current_path do
        with(rails_env: fetch(:stage)) do
          execute :bundle, :exec, :rake, 'db:seed'
        end
      end
    end
  end
  
  desc 'Reset database'
  task :reset_db do
    on roles(:app) do
      within current_path do
        with(rails_env: fetch(:stage)) do
          execute :bundle, :exec, :rake, 'db:drop db:create'
        end
      end
    end
  end
end

