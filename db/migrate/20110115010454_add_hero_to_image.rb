class AddHeroToImage < ActiveRecord::Migration
  def self.up
    add_column :images, :hero, :boolean
  end

  def self.down
    remove_column :images, :hero
  end
end
