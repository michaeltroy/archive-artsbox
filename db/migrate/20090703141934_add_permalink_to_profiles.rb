class AddPermalinkToProfiles < ActiveRecord::Migration
  def self.up
  #  add_column :profiles, :permalink, :string, :default => "permalink"    
  end

  def self.down
    add_column :profiles, :permalink
  end
end
