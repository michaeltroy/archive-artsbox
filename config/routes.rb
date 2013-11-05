require 'digest/sha2'

ActionController::Routing::Routes.draw do |map|
  
  map.root :controller => "home"
  
  # various pages like faqs, about, terms etc
  map.terms_of_service "terms-of-service", :controller => "pages", :action => "terms_of_service"
  
  # routes for authentication etc
  map.login "/login",   :controller => "sessions", :action => "new"
  map.logout "/logout", :controller => "sessions", :action => "destroy"
  map.new_password "/new-password", :controller => "sessions", :action => "send_new_password"
  map.resend_account_activation "/resend-account-activation", :controller => "sessions", :action => "resend_new_account_email"
  map.resource :session  
  
  # routes for general public page views
  map.signup_home_page "signup-home-page", :controller => "home", :action => "new_user"
  map.signup_page "/signup", :controller => "signup", :action => "signup"
  map.signup_page_new_user "signup-page-new-user", :controller => "signup", :action => "new_user"  
  
  map.activation "user/activation/:id", :controller => "users", :action => "activation"
  map.show_user ":permalink", :controller => "users", :action => "show"
  map.edit_user ":permalink/edit", :controller => "users", :action => "edit"
  map.update_user ":permalink/update", :controller => "users", :action => "update"
  
  # Account.
  map.resource :account, :path_prefix => ":permalink"  
  
  #nested  
  map.resources :users do |users|
    users.resources :posts,       :path_prefix => ":permalink"
    users.resources :images,      :path_prefix => ":permalink"    
    users.resources :feeds,       :path_prefix => ":permalink"
    users.resources :events,      :path_prefix => ":permalink"
    users.resources :friends,     :path_prefix => ":permalink"
    users.resources :galleries,   :path_prefix => ":permalink"
    users.resources :items,       :path_prefix => ":permalink"
    users.resources :styles,      :path_prefix => ":permalink"
    users.resources :friendships, :path_prefix => ":permalink" 
    users.resources :newsletters, :user => {:sendmail => :put}    
    
#    users.resources :items do |items|
#      items.resources  :images, :path_prefix => ":permalink/:item"
#    end
    
    users.resources :posts do |posts|
      posts.resources :comments, :path_prefix => ":permalink/:post"
    end
  end
  
  # username url
  map.permalink ":permalink", :controller => "users", :action => "show"
  map.edit_box ":permalink/edit", :controller => "users", :action => "edit"
  map.update_box ":permalink", :controller => "users", :action => "update"  
  
  # catch all
  map.catch_all "#{RAILS_ROOT}/public/404.html", :controller => "catch_all", :action => "index"
  map.connect ":permalink/*", :controller => "catch_all", :action => "index"
  map.connect "*path", :controller => "catch_all", :action => "index"
end