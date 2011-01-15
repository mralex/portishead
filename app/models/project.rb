class Project < ActiveRecord::Base
  before_save :parameterize_name
  
  belongs_to :category
  has_many :images, :dependent => :destroy
  
  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :category_id
  validates_presence_of :worked_on
  
  accepts_nested_attributes_for :images, :reject_if => proc {|a| a['title'].blank? }, :allow_destroy => :true
  
  def visible_images
    images.visible
  end
  
  def hero
    images.hero.first
  end
  
  def to_param
    slug
  end
  
  private
  def parameterize_name
    self.slug = self.name.parameterize
  end
end
