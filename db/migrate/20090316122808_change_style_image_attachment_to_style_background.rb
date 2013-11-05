class ChangeStyleImageAttachmentToStyleBackground < ActiveRecord::Migration
  def self.up
    # first remove unwanted tables
    remove_column :styles, :image_file_name
    remove_column :styles, :image_content_type
    remove_column :styles, :image_file_size
    # set the wanted table names
    add_column :styles, :background_file_name, :string 
    add_column :styles, :background_content_type, :string
    add_column :styles, :background_file_size, :integer
  end

  def self.down
    remove_column :styles, :background_file_name
    remove_column :styles, :background_content_type
    remove_column :styles, :background_file_size
  end
end
