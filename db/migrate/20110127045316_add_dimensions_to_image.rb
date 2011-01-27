class AddDimensionsToImage < ActiveRecord::Migration
  def self.up
    add_column :images, :display_width, :integer
    add_column :images, :display_height, :integer
  end

  def self.down
    remove_column :images, :display_height
    remove_column :images, :display_width
  end
end
