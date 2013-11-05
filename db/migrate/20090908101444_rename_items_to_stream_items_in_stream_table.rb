class RenameItemsToStreamItemsInStreamTable < ActiveRecord::Migration
  def self.up
    rename_column :streams, :items_id, :stream_items_id
    rename_column :streams, :items_type, :stream_items_type
  end

  def self.down
    rename_column :streams, :stream_items_id, :items_id
    rename_column :streams, :stream_items_type, :items_type    
  end
end
