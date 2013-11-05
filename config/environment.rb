# Be sure to restart your server when you modify this file

# Uncomment below to force Rails into production mode when
# you don't control web/app server and can't set it the proper way
# ENV['RAILS_ENV'] ||= 'production'

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '3.1.0' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  
#  config.gem 'will_paginate', :version => '~> 2.3.15', :source => 'http://gemcutter.org'  
#  config.gem "adzap-ar_mailer", :lib => 'action_mailer/ar_mailer', :source => 'http://gems.github.com'
  config.gem "paperclip", :version => '>=2.3', :source => 'http://gems.github.com'  
  
  # mail settings.
  config.action_mailer.smtp_settings = {
    :address          => "mail.metaset.com.au",
    :port             => 25,
    :domain           => "metaset.com.au",
    :authentication   => :login,
    :user_name        => "test@metaset.com.au",
    :password         => "testtest"
  }
  
  # Observers.
  config.active_record.observers = :account_observer, :user_observer, :comment_observer, :post_observer
  
end