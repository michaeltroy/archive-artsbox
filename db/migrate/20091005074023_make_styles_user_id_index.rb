class MakeStylesUserIdIndex < ActiveRecord::Migration
  def self.up
    add_index :styles, :user_id
  end

  def self.down
    remove_index :styles, :user_id
  end
end
