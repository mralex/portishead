class Image < ActiveRecord::Base
  belongs_to :project, :dependent => :destroy
  acts_as_list :scope => :project
  mount_uploader :image, ImageUploader
  
  validates_presence_of :title
  
  scope :visible, where("hidden = ?", false)
  scope :hero, where("hero = ?", true)
  
  attr_accessible :title, :image, :hero, :thumb
  
  def image=(val)
    if !val.is_a?(String) && valid?
      image_will_change!
      super
    end
  end
  
  def thumb
    image.thumb
  end
end
