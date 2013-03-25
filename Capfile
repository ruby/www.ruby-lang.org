load 'deploy'
require 'bundler/capistrano'
require 'capistrano_colors'

set :default_environment, {
  'PATH' => "$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH"
}

set :application, 'neon.ruby-lang.org'
set :scm, :git
set :repository, File.expand_path('..', __FILE__)
set :branch, 'master'
set :deploy_via, :copy

server 'neon.ruby-lang.org', :app, :web, :db, :primary => true

set :user, 'hsbt'
set :deploy_to, defer { "/var/www/#{application}" }
set :use_sudo, false

namespace :deploy do
  desc 'generate static sites'
  task :generate_static_sites do
    run "cd #{latest_release}; LANG=ja_JP.UTF-8 bundle exec rake generate"
  end
end

after 'deploy:update', 'deploy:cleanup'
after 'deploy:finalize_update', 'deploy:generate_static_sites'
