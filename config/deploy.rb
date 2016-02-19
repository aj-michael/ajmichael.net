lock '3.4.0'

set :application, 'ajmichael.net'
set :repo_url, 'git@github.com:aj-michael/ajmichael.net.git'
set :user, 'deploy'
set :user_sudo, false
set :deploy_to, '/srv/www/ajmichael.net'
set :scm, :git
set :format, :pretty
set :log_level, :debug
set :pty, true

role :web, 'ajmichael.net'

namespace :deploy do
  before :restart, :build_public do
    on roles(:app) do
      within release_path do
        execute '/usr/local/rvm/gems/ruby-2.2.1/wrappers/jekyll', 'build --destination public'
      end
    end
  end

  after :publishing, :restart
end
