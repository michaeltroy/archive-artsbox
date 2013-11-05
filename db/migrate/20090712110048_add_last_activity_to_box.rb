class AddLastActivityToBox < ActiveRecord::Migration
  def self.up
   # add_column :boxes, :last_activity, :string 
  #  add_column :boxes, :last_activity_at, :datetime
  end

  def self.down
   # remove_column :boxes, :last_activity 
  #  remove_column :boxes, :last_activity_at
  end
end
