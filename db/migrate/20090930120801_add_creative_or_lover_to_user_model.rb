class AddCreativeOrLoverToUserModel < ActiveRecord::Migration
  def self.up
    add_column :users, :persona, :string, :default => "creative" 
  end

  def self.down
    remove_column :users, :persona
  end
end
