class Project < ActiveRecord::Base
  before_save :parameterize_name
  
  belongs_to :category
  belongs_to :client
  
  has_many :images, :dependent => :destroy
  has_many :links, :dependent => :destroy
  
  validates_presence_of :name
  validates_presence_of :client
  validates_presence_of :description
  validates_presence_of :category
  validates_presence_of :worked_on
  
  accepts_nested_attributes_for :images, :reject_if => proc {|a| a['title'].blank? }, :allow_destroy => :true
  accepts_nested_attributes_for :links, :reject_if => proc {|a| a['title'].blank? }, :allow_destroy => :true
  accepts_nested_attributes_for :client, :reject_if => proc {|a| a['name'].blank? }
  accepts_nested_attributes_for :category, :reject_if => proc {|a| a['name'].blank? }
  
  acts_as_list
  
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
