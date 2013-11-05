class MakeStreamPolymorphic < ActiveRecord::Migration
  def self.up
    add_column :streams,  :name,        :string
    add_column :streams,  :items_id,    :integer
    add_column :streams,  :items_type,  :string
  end

  def self.down
    drop_table :stream
  end
end
