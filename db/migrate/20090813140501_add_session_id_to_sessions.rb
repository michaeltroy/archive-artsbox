class AddSessionIdToSessions < ActiveRecord::Migration
  def self.up
   # add_column :sessions, :session_id, :string
  end

  def self.down
   #  remove_column :sessions, :session_id
  end
end
