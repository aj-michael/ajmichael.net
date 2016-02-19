set :stage, :production

server 'ajmichael.net', user: 'deploy', port: 22, roles: %w{web app}

set :bundle_binstubs, nil

set :bundle_flags, '--deployment'
set :rvm_type, :user

#SSHKit.config.command_map[:rake] = "bundle exec rake"

namespace :deploy do

  desc "Restarting application"
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do

    end
  end

  after :finishing, 'deploy:cleanup'

end

