class Image < ActiveRecord::Base
  belongs_to :project
  acts_as_list :scope => :project
  mount_uploader :image, ImageUploader
  
  before_save :update_dimensions
  
  validates_presence_of :title
  
  scope :visible, where("hidden = ?", false)
  scope :hero, where("hero = ?", true)
  
  attr_accessible :title, :image, :hero, :thumb, :hidden
  
  def image=(val)
    if !val.is_a?(String) && valid?
      image_will_change!
      super
    end
  end
  
  def thumb
    image.thumb
  end
  
  private
  def update_dimensions
    display = Magick::Image.read(Rails.root.to_s + "/public" + self.image.display.url).first
    self.display_width = display.columns
    self.display_height = display.rows
  end
end
