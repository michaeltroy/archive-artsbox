class AddStylesPageColor < ActiveRecord::Migration
  def self.up
      add_column :styles, :page_color, :string, :default => "#FFFFFF"
  end

  def self.down
    remove_column :styles, :page_color
  end
end
