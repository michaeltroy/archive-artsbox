class AddBackToExisitingUsers < ActiveRecord::Migration
  def self.up
   #  User.find(:all).each { |user| user.create_style if user.style == nil  }
  end

  def self.down
  end
end