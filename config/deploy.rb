# config valid for current version and patch releases of Capistrano
lock '~> 3.10.1'

set :application, 'IESS'

set :repo_url, 'git@github.com:ronakjain90/iess_v2.git'

# Default branch is :master
set :branch, :master

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, '/var/www/IESS'

# Default value for :format is :airbrussh.
set :format, :airbrussh

set :pty, true

set :log_level, :debug

# append :linked_files, 'config/puma.rb'

# Default value for linked_dirs is []
# append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system'

set :keep_releases, 5

set :ssh_options, {
  verify_host_key: :secure,
  forward_agent: true,
  keys: %w(~/.ssh/id_rsa)
}
