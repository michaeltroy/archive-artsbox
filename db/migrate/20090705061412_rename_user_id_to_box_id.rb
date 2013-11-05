class RenameUserIdToBoxId < ActiveRecord::Migration
  def self.up
    rename_column :posts, :user_id, :box_id
    rename_column :comments, :user_id, :box_id
    rename_column :events, :user_id, :box_id
    #rename_column :friendships, :user_id, :box_id
    #rename_column :items, :user_id, :box_id
    rename_column :images, :user_id, :box_id
    rename_column :newsletters, :user_id, :box_id
    rename_column :styles, :user_id, :box_id
  end

  def self.down
  end
end
