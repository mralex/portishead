class Category < ActiveRecord::Base
  has_many :projects

  validates_presence_of :name
end
