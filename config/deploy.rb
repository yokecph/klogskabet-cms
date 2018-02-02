# config valid for current version and patch releases of Capistrano
lock "~> 3.10.1"

set :repo_url, 'git@github.com:yokecph/klogskabet-cms.git'

# Note: Most values are set in the individual deployment schemes

# Set this value per deployment scheme
# set :application, "my_app_name"

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, "/var/www/my_app_name"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Config files should be copied by setup:config
# Default is []
set(:config_files, fetch(:config_files, []).push(
  'nginx.conf',
  'database.yml',
  'logrotate.conf',
  'unicorn.rb',
  'unicorn.service',
  'resque.service',
  'secrets.yml',
  'application.yml',
  'polkit.rules'
))

# Default value for :linked_files is []
append :linked_files, "config/database.yml", "config/secrets.yml", "config/application.yml"

# Default value for linked_dirs is []
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure

namespace :deploy do
  after :finishing, 'deploy:cleanup'

  # As of Capistrano 3.1, the `deploy:restart` task is not called automatically.
  after 'deploy:publishing', 'deploy:unicorn:reload'
end
