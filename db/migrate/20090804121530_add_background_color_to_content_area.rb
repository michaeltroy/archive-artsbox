class AddBackgroundColorToContentArea < ActiveRecord::Migration
  def self.up
    add_column :styles, :content_background_color, :string
  end

  def self.down
    remove_column :styles, :content_background_color
  end
end