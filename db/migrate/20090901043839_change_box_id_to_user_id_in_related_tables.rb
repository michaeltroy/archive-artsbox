class ChangeBoxIdToUserIdInRelatedTables < ActiveRecord::Migration
  def self.up
    rename_column :posts, :box_id, :user_id
    rename_column :comments, :box_id, :user_id
    rename_column :events, :box_id, :user_id
    #rename_column :friendships, :box_id, :user_id
   #rename_column :items, :box_id, :user_id
    rename_column :images, :box_id, :user_id
    rename_column :newsletters, :box_id, :user_id
    rename_column :streams, :box_id, :user_id
    rename_column :styles, :box_id, :user_id
  end

  def self.down
  end
end
