set :application, 'ajmichael.net'
set :repository, '_site'
set :scm, :none
set :deploy_via, :copy
set :copy_compression, :gzip
set :use_sudo, false

role :web, 'ajmichael.net'
role :app, 'ajmichael.net'

set :user, 'deploy'

set :deploy_to, '/srv/www/ajmichael.net'
before 'deploy:update', 'deploy:update_jekyll'

namespace :deploy do
  [:start, :stop, :restart, :finalize_update].each do |t|
    desc "Ignoring #{t}"
    task t, :roles => :app do ; end
  end

  desc 'Run jekyll to update site before uploading'
  task :update_jekyll do
    %x(rm -rf _site/* && jekyll build)
  end
end
