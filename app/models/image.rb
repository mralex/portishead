class Image < ActiveRecord::Base
  belongs_to :project
  acts_as_list :scope => :project
  mount_uploader :image, ImageUploader
  
  #validates_presence_of :title
  
  def image=(val)
    if !val.is_a?(String) && valid?
      image_will_change!
      super
    end
  end
  
end
