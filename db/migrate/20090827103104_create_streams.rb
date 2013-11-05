class CreateStreams < ActiveRecord::Migration
  def self.up
    create_table :streams do |t|
      t.integer   :box_id
      t.string    :action
      t.integer   :post_id
      t.integer   :comment_id
      t.timestamps
    end
  end

  def self.down
    drop_table :streams
  end
end
