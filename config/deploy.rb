lock "~> 3.11.1"

set :application, "questions"
set :repo_url, "https://git.heroku.com/gentle-hamlet-01543.git"
set :deploy_to, "/var/www/questions"
set :format, :pretty
set :linked_files, %w{config/database.yml config/secrets.yml}
set :linked_dirs, %w{log public/system public/uploads}
set :keep_releases, 5
set :rails_env, :production
