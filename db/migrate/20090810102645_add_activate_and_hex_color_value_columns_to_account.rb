class AddActivateAndHexColorValueColumnsToAccount < ActiveRecord::Migration
 def self.up
    add_column :accounts, :active,    :boolean
#    add_column :accounts, :color_one,   :string
#    add_column :accounts, :color_two,   :string
#    add_column :accounts, :color_three, :string    
  end

  def self.down
    remove_column :accounts,  :active
#    remove_column :accounts,  :color_one
#    remove_column :accounts,  :color_two
#    remove_column :accounts,  :colour_three
  end
end
