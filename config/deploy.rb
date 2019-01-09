lock "~> 3.11.0"

set :git

# Default value for :format is :airbrussh.
set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
set :pty, false

# Default value for :linked_files is []
append :linked_files, %w{config/database.yml config/secrets.yml}

# Default value for linked_dirs is []
append :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system public/uploads app/javascripts}

# set :local_user, -> { `git config user.name`.chomp }
set :local_user, 'cong'

# Default value for keep_releases is 5
set :keep_releases, 5
set :use_sudo, false

namespace :yarn do
  desc 'Install npm package'
  task :install do
    on roles(:app) do
      execute :yarn, :install
    end
  end
end

namespace :deploy do
  desc 'Seed the database'
  task :seed_db do
    on roles(:app) do
      execute :bundle, :exec, :rails, 'db:seed'
    end
  end
  
  desc 'Reset database'
  task :reset_db do
    on roles(:app) do
      execute :bundle, :exec, :rake, 'db:drop db:create'
    end
  end
end
