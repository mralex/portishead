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
  task :start, :roles => :app do ;end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{File.join(current_path,'tmp','restart.txt')}"
  end
  
  after "deploy:update_code", :link_uploads
end

desc "Update uploads symlink"
task :link_uploads do
  run "ln -s #{deploy_to}/#{shared_dir}/config/database.yml #{current_release}/config/database.yml"
  run "ln -s #{deploy_to}/#{shared_dir}/config/app.yml #{current_release}/config/app.yml"
  run "rm -rf #{current_release}/public/uploads"
  run "ln -s #{deploy_to}/#{shared_dir}/uploads #{current_release}/public"
end

after "deploy", "deploy:cleanup" # keeps only last 5 releases
