class RenameColumnBackgroundInStyles < ActiveRecord::Migration
  def self.up
    rename_column :styles, :background, :background_color
  end

  def self.down
    rename_column :styles, :background_color, :background
  end
end
