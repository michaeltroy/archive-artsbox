class AddOptionForUserBackgroundColor < ActiveRecord::Migration
  def self.up
    add_column :styles, :background_color, :string, :default => "#EAEAEA"
  end

  def self.down
    remove_column :styles, :background_color
  end
end