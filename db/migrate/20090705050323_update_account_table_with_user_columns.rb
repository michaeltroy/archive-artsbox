class UpdateAccountTableWithUserColumns < ActiveRecord::Migration
  def self.up
    #add required columns
    add_column :accounts, :email, :string
    add_column :accounts, :role, :string, :default => "user"
    add_column :accounts, :password_hash, :string
    add_column :accounts, :password_salt, :string    
    
    # remove obsolete columns
    remove_column :accounts, :user_id
  end

  def self.down
    remove_column :accounts, :email
    remove_column :accounts, :role
    remove_column :accounts, :password_hash
    remove_column :accounts, :password_salt    
  end
end
