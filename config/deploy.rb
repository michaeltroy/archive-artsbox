
  set :stages, %w(staging production)
  set :default_stage, "staging"
  set :use_sudo, :false
  
  require 'capistrano/ext/multistage'