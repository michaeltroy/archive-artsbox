class ChangeNameOfActiveColumnInAccount < ActiveRecord::Migration
  def self.up
    rename_column :accounts, :active, :activated
  end

  def self.down
    rename_column :accounts, :activated, :active
  end
end