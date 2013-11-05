class ChangeNameInImagesProductsIdToItemsId < ActiveRecord::Migration
  def self.up
    rename_column :images, :product_id, :item_id
  end

  def self.down
  end
end
