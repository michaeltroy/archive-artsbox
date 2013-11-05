class AddUserIdToNewsletter < ActiveRecord::Migration
  def self.up
    add_column :newsletters, :user_id, :integer
  end

  def self.down
    remove_column :newsletters, :user_id
  end
end
