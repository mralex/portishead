require 'bundler/capistrano'
APP_CONFIG = YAML.load(File.read(File.expand_path("../app.yml", __FILE__)))

set :application, "#{APP_CONFIG['deploy']['application']}"

set :user, "rails"
set :deploy_to, "/sites/#{application}"
set :deploy_via, :remote_cache
set :use_sudo, false

set :scm, :git
set :repository, "git@github.com:mralex/portishead.git"
set :branch, "master"

set(:rails_env) { "production" }

role :web, application                          # Your HTTP server, Apache/etc
role :app, application                   # This may be the same as your `Web` server
role :db,  application, :primary => true # This is where Rails migrations will run


namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end