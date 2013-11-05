# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  
  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery :only => '11f6377c3030333cccc63e5e81b31f75'
  
  before_filter :active, :all_users, :this_environment
  
  # Find active user.
  def active()
    if session[:user_id]
      @active = User.find(session[:user_id])
      else session = nil 
    end
  end
  
  # Find all users.
  def all_users
    @users = User.find(:all)
  end
  
  # What environment?
  def what_environment
    if RAILS_ENV == "devlopment"
       "artsbox.local"
     elsif
       RAILS_ENV == "staging"
       "174.143.173.60"
     else # must be production
       "http://artsbox.com"
    end   
  end  
  
  def this_environment
    @environment = what_environment
  end

end
