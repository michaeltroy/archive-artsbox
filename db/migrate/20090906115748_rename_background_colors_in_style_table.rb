class RenameBackgroundColorsInStyleTable < ActiveRecord::Migration
  def self.up
    rename_column :styles, :content_background_color, :content_background
    rename_column :styles, :side_panel_background_color, :side_panel_background
    rename_column :styles, :left_panel_background_color, :left_panel_background
    rename_column :styles, :background_color, :background
  end

  def self.down
    rename_column :styles, :content_background, :content_background_color
    rename_column :styles, :side_panel_background, :side_panel_background_color
    rename_column :styles, :left_panel_background, :left_panel_background_color
    rename_column :styles, :background, :background_color
  end
end
