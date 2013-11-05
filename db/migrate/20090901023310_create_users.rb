class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string    :username
      t.string    :permalink
      t.text      :description
      t.string    :avatar_file_name
      t.string    :avatar_content_type
      t.integer   :avatar_file_size
      t.integer   :account_id
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
