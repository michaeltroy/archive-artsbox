class Something < ActiveRecord::Migration
  def self.up
    add_column  :styles, :something, :string
  end

  def self.down
    remove_column :styles, :something
  end
end
