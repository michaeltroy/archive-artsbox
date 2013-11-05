class RenameMemberIdColumnsToUserId < ActiveRecord::Migration
  def self.up
    rename_column :comments, :member_id, :user_id
    rename_column :events, :member_id, :user_id 
    rename_column :images, :member_id, :user_id 
    rename_column :posts, :member_id, :user_id 
  end

  def self.down
  end
end
