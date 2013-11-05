class CreateImages < ActiveRecord::Migration
  def self.up
    create_table :images do |t|
      t.integer :parent_id
      t.integer :size
      t.integer :width
      t.integer :height
      t.string :content_type
      t.string :filename
      t.string :thumbnail
      
      t.integer :gallery_id
      t.integer :member_id
      t.integer :event_id

      t.timestamps
    end
  end

  def self.down
    drop_table :images
  end
end
