class AddUserBlank < ActiveRecord::Migration
  def self.up
    add_column :users, :blank, :string, :default => ""
  end

  def self.down
    remove_column :users, :blank
  end
end
