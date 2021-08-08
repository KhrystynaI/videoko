require 'mina/rails'
require 'mina/git'
require 'mina/bundler'
#require 'mina/rvm'    # for rvm support. (https://rvm.io)
require 'mina/rbenv'
require 'mina/whenever'
 project_name = 'videoko'

 set :project_name, project_name
 set :domain, "3.17.155.122"
 set :deploy_to, "/home/ubuntu/#{project_name}"
 set :repository, "git@github.com:KhrystynaInzhuvatova/videoko.git"
 set :bundle_path, "/home/ubuntu/#{project_name}/shared/bundle"
 set :branch, ENV['branch'] || 'master'

 set :shared_dirs, fetch(:shared_dirs, []).push('storage', 'upload')
 set :shared_files, fetch(:shared_files, []).push(
   'config/master.key',
   '.env',
   'db/production.sqlite3'
 )

set :user, 'ubuntu' # Username in the server to SSH to.

task :remote_environment do
  # If you're using rbenv, use this to load the rbenv environment.
  # Be sure to commit your .ruby-version or .rbenv-version to your repository.
  invoke :'rbenv:load'

  # For those using RVM, use this to load an RVM version@gemset.
  #invoke 'rvm:use', 'ruby-2.6.3'
end

# Put any custom commands you need to run at setup
# All paths in `shared_dirs` and `shared_paths` will be created on their own.
task :setup do
  #command %(rvm install 2.6.3)
  #command %(rvm use 2.6.3)
  #command %(gem install bundler)
end

task setup: :remote_environment do
  deploy_to   = fetch(:deploy_to)
  shared_path = fetch(:shared_path)
  command %(sudo mkdir -p "#{deploy_to}")
  command %(sudo chown -R ubuntu:ubuntu "#{deploy_to}")

  command %(mkdir -p "#{shared_path}/log")
  command %(chmod g+rx,u+rwx "#{shared_path}/log")

  command %(mkdir -p "#{shared_path}/config")
  command %(chmod g+rx,u+rwx "#{shared_path}/config")

  command %(mkdir -p "#{shared_path}/db")
  command %(chmod g+rx,u+rwx "#{shared_path}/db")

  command %(touch "#{shared_path}/config/database.yml")
  command %(touch "#{shared_path}/config/master.key")
  command %(echo "-----> Be sure to edit '#{shared_path}/config/database.yml' and 'master.key'.")

  command %(
    repo_host=`echo $repo | sed -e 's/.*@//g' -e 's/:.*//g'` &&
    repo_port=`echo $repo | grep -o ':[0-9]*' | sed -e 's/://g'` &&
    if [ -z "${repo_port}" ]; then repo_port=22; fi &&
    ssh-keyscan -p $repo_port -H $repo_host >> ~/.ssh/known_hosts
  )
  command %(sudo apt-get install nodejs)

  #invoke :'nginx:enable_site'
end

desc "Deploys the current version to the server."
task :deploy do
  # uncomment this line to make sure you pushed your local branch to the remote origin
  # invoke :'git:ensure_pushed'
  deploy do
    # Put things that will set up an empty directory into a fully set-up
    # instance of your project.
    invoke :'git:clone'
    invoke :'deploy:link_shared_paths'
    invoke :'bundle:install'
    #invoke :'rails:db_create'
    invoke :'rails:db_migrate'
    invoke :'rails:assets_precompile'
    invoke :'deploy:cleanup'

    on :launch do
      in_path(fetch(:current_path)) do
        command %{mkdir -p tmp/}
        command %{touch tmp/restart.txt}
      end
    end
  end

  # you can use `run :local` to run tasks on local machine before of after the deploy scripts
  # run(:local){ say 'done' }
end

# For help in making your deploy script, see the Mina documentation:
#
#  - https://github.com/mina-deploy/mina/tree/master/docs
