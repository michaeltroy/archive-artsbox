class RenameStreamItemsToStreamItem < ActiveRecord::Migration
  def self.up
    rename_column :streams, :stream_items_id, :stream_item_id
    rename_column :streams, :stream_items_type, :stream_item_type
  end

  def self.down
    rename_column :streams, :stream_item_id, :stream_items_id
    rename_column :streams, :stream_item_type, :stream_items_type 
  end
end
