class RenameColumnTypeInAccountToPlan < ActiveRecord::Migration
  def self.up
    rename_column :accounts, "type", "plan"
  end

  def self.down
  end
end
