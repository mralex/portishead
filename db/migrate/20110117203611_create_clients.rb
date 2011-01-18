class CreateClients < ActiveRecord::Migration
  def self.up
    create_table :clients do |t|
      t.string :name
      t.string :slug
      t.text :description
      t.string :url
      t.date :started_at
      t.date :ended_at

      t.timestamps
    end
  end

  def self.down
    drop_table :clients
  end
end
