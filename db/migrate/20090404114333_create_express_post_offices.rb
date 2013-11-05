class CreateExpressPostOffices < ActiveRecord::Migration
  def self.up
    create_table :express_post_offices do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :express_post_offices
  end
end
