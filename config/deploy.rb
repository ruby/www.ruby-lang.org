require 'mina/git'
require 'mina/bundler'
require 'mina/rbenv'

set :domain, 'neon.ruby-lang.org'
set :user, 'rubylang'
set :deploy_to, "/home/#{user}/www.ruby-lang.org"
set :repository, 'https://github.com/ruby/www.ruby-lang.org.git'
set :branch, 'master'

task :environment do
  invoke :'rbenv:load'
end

desc "Generate static sites."
task :generate_static_sites => :environment do
  queue 'bundle exec rake generate'
end

desc "Deploys the current version to the server."
task :deploy => :environment do
  deploy do
    invoke :'git:clone'
    invoke :'bundle:install'
    invoke :generate_static_sites
  end
end
