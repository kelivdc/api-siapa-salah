# config valid for current version and patch releases of Capistrano
lock "~> 3.17.1"

set :application, "paniwisata"
set :repo_url, "git@github.com:kelivdc/api-siapa-salah.git"
set :deploy_to, "/home/deploy/#{fetch :application}"
append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', '.bundle', 'public/system', 'public/uploads'
append :linked_files, "config/master.key"
set :keep_releases, 5