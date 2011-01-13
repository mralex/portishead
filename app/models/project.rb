class Project < ActiveRecord::Base
  before_save :parameterize_name
  
  belongs_to :category
  has_many :images
  
  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :category_id
  
  accepts_nested_attributes_for :images, :reject_if => lambda { |a| a[:image].blank? }
  
  def to_param
    slug
  end
  
  private
  def parameterize_name
    self.slug = self.name.parameterize
  end
end
