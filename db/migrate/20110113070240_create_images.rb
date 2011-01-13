class CreateImages < ActiveRecord::Migration
  def self.up
    create_table :images do |t|
      t.string :title
      t.integer :project_id
      t.string :image

      t.timestamps
    end
  end

  def self.down
    drop_table :images
  end
end
