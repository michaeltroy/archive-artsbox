class AddStylesForLinksAndGeneralFormating < ActiveRecord::Migration
  def self.up
    change_column :styles, :box_panel_background_color, :string, :default => "#FFF"    
    change_column :styles, :content_background_color, :string, :default => "#FFF"
    change_column :styles, :side_panel_background_color, :string, :default => "#FFF"
    
    add_column :styles, :p, :string, :default => "#000"
    add_column :styles, :h1, :string, :default => "#666"
    add_column :styles, :h2, :string, :default => "#999"
    add_column :styles, :h3, :string, :default => "#CCC"
    add_column :styles, :a, :string, :default => "#333"
  end

  def self.down   
    remove_column :styles, :p
    remove_column :styles, :h1
    remove_column :styles, :h2
    remove_column :styles, :h3
    remove_column :styles, :a
  end
end