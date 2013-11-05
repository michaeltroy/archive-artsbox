class CreateStyles < ActiveRecord::Migration
  def self.up
    create_table :styles do |t|
      t.string  :background
      t.timestamps
    end
  end

  def self.down
    drop_table :styles
  end
end
