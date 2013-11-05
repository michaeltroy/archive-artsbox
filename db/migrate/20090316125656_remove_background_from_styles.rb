class RemoveBackgroundFromStyles < ActiveRecord::Migration
  def self.up
    remove_column :styles, :background
  end

  def self.down
  end
end
