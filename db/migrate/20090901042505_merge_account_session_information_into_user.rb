class MergeAccountSessionInformationIntoUser < ActiveRecord::Migration
  def self.up
    add_column :users, :role, :string, :default => "user"
    add_column :users, :password_hash, :string
    add_column :users, :password_salt, :string
    add_column :users, :activation_code, :string
    add_column :users, :activated_at, :datetime
  end

  def self.down
    remove_column :users, :role
    remove_column :users, :password_hash
    remove_column :users, :password_salt
    remove_column :users, :activation_code
    remove_column :users, :activated_at
  end
end
