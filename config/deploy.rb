# config valid only for Capistrano 3.1
lock '3.1.0'

user = ENV['DEPLOY_USER']
application = ENV['DEPLOY_APPLICATION']

set :application, application
set :user, user
set :port, ENV['DEPLOY_PORT']

role :app, "#{ENV['DEPLOY_IP']}:#{ENV['DEPLOY_PORT']}"
server "#{ENV['DEPLOY_IP']}:#{ENV['DEPLOY_PORT']}", user: user, roles: %w{:web, :app, :db}, primary: true

set :deploy_to, "/home/#{user}/apps/#{application}"
set :deploy_via, :remote_cache
set :use_sudo, false

set :scm, 'git'
set :repo_url, "#{ENV['REPO_URL']}/#{application}.git"
set :branch, 'master'
set :pty, true

set :deploy_via, :remote_cache
set :deploy_to, "/home/#{user}/apps/#{application}"

set :ssh_options, {
  # verbose: :debug,
  keys: %w(~/.ssh/macbook ~/.ssh/id_rsa),
  forward_agent: true
}

set :linked_files, %w{config/database.yml}
set :linked_dirs, %w{public/screenshots public/thumbnails}

# default_run_options[:pty] = true
# ssh_options[:forward_agent] = true
# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

# Default deploy_to directory is /var/www/my_app
# set :deploy_to, '/var/www/my_app'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, %w{config/database.yml}

# Default value for linked_dirs is []
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

namespace :deploy do
  # task :start do ; end
  # task :stop do ; end

  # task :restart, roles: :app, except: { no_release: true } do
  #   execute("#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}")
  # end

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      # execute("touch #{File.join(current_path,'tmp','restart.txt')}")
      execute("touch #{release_path.join('tmp/restart.txt')}", shell: :sh)
    end
  end

  desc 'Clean app'
  task :clean do
    on roles(:app), in: :sequence, wait: 5 do
      execute("cd #{current_path}; RAILS_ENV=production rake db:drop", shell: :sh)
      execute("cd #{current_path}; RAILS_ENV=production rake db:create", shell: :sh)
      execute("cd #{current_path}; RAILS_ENV=production rake db:migrate", shell: :sh)
      execute("cd #{current_path}; RAILS_ENV=production rake db:seed", shell: :sh)
    end
  end

  task :notify_rollbar do
    on roles(:app) do |h|
      revision = `git log -n 1 --pretty=format:"%H"`
      local_user = `whoami`
      rollbar_token = ENV['ROLLBAR_TOKEN']
      rails_env = fetch(:rails_env, 'production')
      execute "curl https://api.rollbar.com/api/1/deploy/ -F access_token=#{rollbar_token} -F environment=#{rails_env} -F revision=#{revision} -F local_username=#{local_user} >/dev/null 2>&1", :once => true
    end
  end

  after :publishing, :restart
  after :deploy, 'notify_rollbar'

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end
