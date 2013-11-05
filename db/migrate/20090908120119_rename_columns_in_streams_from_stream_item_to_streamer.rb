class RenameColumnsInStreamsFromStreamItemToStreamer < ActiveRecord::Migration
  def self.up
    rename_column :streams, :stream_item_id, :streamer_id
    rename_column :streams, :stream_item_type, :streamer_type
  end

  def self.down
    rename_column :streams, :streamer_id, :stream_item_id
    rename_column :streams, :streamer_type, :stream_item_type 
  end
end
