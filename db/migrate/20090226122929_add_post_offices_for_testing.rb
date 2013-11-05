class AddPostOfficesForTesting < ActiveRecord::Migration
  def self.up
      create_table :post_offices do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table  :post_offices
  end
end

