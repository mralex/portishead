class AddProjectListBoolToImages < ActiveRecord::Migration
  def self.up
    add_column :images, :project_list, :Boolean
  end

  def self.down
    remove_column :images, :project_list
  end
end
