set :production

server '198.58.123.31', user: 'vando', roles: %w{web app db}

set :application, 'questions'
set :repo_url, "https://git.heroku.com/gentle-hamlet-01543.git"
set :branch, 'master'

set :rollbar_env, :production
set :rails_env, :production
set :rollbar_role, Proc.new { :app }

namespace :deploy do
  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  desc 'Runs rake db:seed for SeedMigrations data'
  task :seed => [:set_rails_env] do
    on primary fetch(:migration_role) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :rake, "db:seed"
        end
      end
    end
  end

  after :finishing, 'deploy:cleanup'
  after :cleanup, 'deploy:restart'
end
