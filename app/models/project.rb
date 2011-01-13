class Project < ActiveRecord::Base
  belongs_to :category
  has_many :images
  
  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :category_id
end
