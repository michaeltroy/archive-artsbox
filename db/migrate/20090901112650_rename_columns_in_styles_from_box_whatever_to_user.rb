class RenameColumnsInStylesFromBoxWhateverToUser < ActiveRecord::Migration
  def self.up
    rename_column :styles, :box_panel_background_color, :left_panel_background_color
  end

  def self.down
  end
end
