class AddBackgroundColorToPanels < ActiveRecord::Migration
  def self.up
    add_column :styles, :side_panel_background_color, :string
    add_column :styles, :box_panel_background_color, :string
  end

  def self.down
    remove_column :styles, :side_panel_background_color
    remove_column :styles, :box_panel_background_color
  end
end
