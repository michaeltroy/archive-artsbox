class AddImageToImage < ActiveRecord::Migration
  def self.up
      add_column :images, :image_file_name, :string # Original filename
      add_column :images, :image_content_type, :string # Mime type
      add_column :images, :image_file_size, :integer # File size in bytes
    end

    def self.down
      remove_column :images, :image_file_name
      remove_column :images, :image_content_type
      remove_column :images, :image_file_size
  end
end
