class Image < ActiveRecord::Base
  belongs_to :project
  acts_as_list :scope => :project
  mount_uploader :image, ImageUploader
  
  before_save :ensure_uploaded_sizes
  before_save :update_dimensions
  
  validates_presence_of :title
  
  scope :visible, where("hidden = ?", false)
  scope :hero, where("hero = ?", true)
  scope :project, where("project_list = ?", true)
  
  attr_accessible :title, :image, :hero, :thumb, :hidden, :project_list
  
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
  
  def ensure_uploaded_sizes
    public_path = Rails.root.to_s + "/public"
    image = Magick::Image.read(public_path + self.image.url).first
    
    w = image.columns
    h = image.rows
    
    if (w == 940 && h == 300) 
      FileUtils.cp(public_path + self.image.url, public_path + self.image.hero.url)
    end
    
    if (w == 300 && h == 200) 
      FileUtils.cp(public_path + self.image.url, public_path + self.image.small.url)
    end
    
    # FIXME: This might be incorrect
    if (w <= 700 && h <= 700) 
      FileUtils.cp(public_path + self.image.url, public_path + self.image.display.url)
    end
  end
end
