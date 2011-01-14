class AddPositionToImage < ActiveRecord::Migration
  def self.up
    add_column :images, :position, :integer
  end

  def self.down
    remove_column :images, :position
  end
end
