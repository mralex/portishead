class Client < ActiveRecord::Base
  before_save :parameterize_name
  has_many :projects
  
  validates_presence_of :name
  
  def to_param
    slug
  end
  
  private
  def parameterize_name
    self.slug = self.name.parameterize
  end
end
