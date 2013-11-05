class ChangeDefaultDataInTableAccountsColumnPlan < ActiveRecord::Migration
  def self.up
    change_column :accounts, :plan, :string, :default => "free"
  end

  def self.down
  end
end
