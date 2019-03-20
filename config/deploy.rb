# frozen_string_literal: true

# config valid for current version and patch releases of Capistrano
rvm_ruby = File.read('.ruby-version').strip
lock '~> 3.6.1'

# config valid only for current version of Capistrano

set :application, 'nguoimexe'
set :repo_url, 'git@github.com:nguyenthanhcong101096/nguoimexe.git'
set :branch, :master

set :deploy_to, '/home/deploy/nguoimexe'
set :use_sudo, false

# capistrano-rails
set :rails_env, :production
set :migration_role, :web

set :assets_prefix, 'static'
set :rails_assets_groups, :assets
# If you need to touch public/images, public/javascripts, and public/stylesheets on each deploy
set :normalize_asset_timestamps, ['public/static']
set :keep_assets, 3

set :pty, true
set :linked_files, %w[config/database.yml config/application.yml]
set :linked_dirs, %w[log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system public/uploads public/app node_modules app/javascripts]
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
set :puma_bind, "unix://#{shared_path}/tmp/sockets/puma.sock" # accept array for multi-bind
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

# Global options
set :ssh_options, forward_agent: true

namespace :npm do
  desc 'Run rake npm install'
  task :install do
    on roles(:web) do
      within release_path do
        execute("cd #{release_path} && npm install")
      end
    end
  end
end

namespace :deploy do
  desc 'Upload yml file.'
  task :upload_yml do
    on roles(:app) do
      execute "mkdir -p #{shared_path}/config/puma"
      execute "mkdir -p #{shared_path}/node_modules"
      upload!('package.json', "#{shared_path}/package.json")
      upload!('config/database.yml', "#{shared_path}/config/database.yml")
      upload!('config/secrets.yml', "#{shared_path}/config/secrets.yml")
    end
  end

  desc 'Seed the database.'
  task :db_seed do
    on roles(:app) do
      within release_path do
        with(rails_env: fetch(:stage)) do
          execute :bundle, :exec, :rake, 'db:seed'
        end
      end
    end
  end

  desc 'Reset database'
  task :db_reset do
    on roles(:app) do
      within release_path do
        with(rails_env: fetch(:stage)) do
          execute :rake, 'db:migrate:reset'
        end
      end
    end
  end

  desc 'Backup database'
  task :db_backup do
    on roles(:app) do
      within release_path do
        with(rails_env: fetch(:stage)) do
          execute 'PGPASSWORD="password" pg_dump -F c -v -U nguoimexe -h localhost nguoimexe_production -f /home/deploy/nguoimexe/nguoimexe_backup.psql'
        end
      end
    end
  end

  desc 'Restore database'
  task :db_restore do
    on roles(:app) do
      within release_path do
        with(rails_env: fetch(:stage)) do
          execute 'PGPASSWORD="password" pg_restore -d nguoimexe_production -h localhost /home/deploy/nguoimexe/nguoimexe_backup.psql -c -U nguoimexe'
        end
      end
    end
  end

  desc 'Update Crontab'
  task :update_crontab do
    on roles(:app) do
      within release_path do
        with(rails_env: fetch(:stage)) do
          execute "cd #{release_path} && whenever --update-crontab nguoimexe"
        end
      end
    end
  end
  
  desc 'Log Production'
  task :log do
    on roles(:app) do
      within release_path do
        with(rails_env: fetch(:stage)) do
          execute "cd nguoimexe/shared/log && nano production.log"
        end
      end
    end
  end
end

namespace :maintenance do
  desc 'Switch current project into maintenance mode'
  task :enable do
    on primary :db do
      within release_path do
        execute "cd nguoimexe && mv maintenance_off.html maintenance_on.html"
      end
    end
  end
 
  desc 'Turn off current project maintenance mode'
  task :disable do
    on primary :db do
      within release_path do
        execute "cd nguoimexe && mv maintenance_on.html maintenance_off.html"
      end
    end
  end
end

before('deploy:assets:precompile', 'npm:install')

# pg_dump -F c -v -U postgres -h localhost nguoimexe_development -f ~/Desktop/nguoimexe/test_db.psql
# pg_restore -d nguoimexe_development ~/Desktop/nguoimexe/test_db.psql -c -U postgres
