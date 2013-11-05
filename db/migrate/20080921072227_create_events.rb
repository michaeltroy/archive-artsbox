class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string :title
      t.string :location
      t.string :venue
      t.string :artist
      t.text :body
      t.string :link
      t.string :permalink
      t.datetime :start_date
      t.datetime :start_time
      t.datetime :end_date
      t.datetime :end_time
      t.datetime :opening_date
      t.datetime :opening_time
      t.integer :member_id

      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
