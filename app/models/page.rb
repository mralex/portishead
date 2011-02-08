class Page < ActiveRecord::Base
  before_save :parameterize_slug
  
  validates :slug, :presence => true, :uniqueness => true
  validates :slug, :format => { :with => /^[-A-Za-z0-9\d_]+$/ }
  
  def to_param
    slug.parameterize
  end
  
  private
  def parameterize_slug
    self.slug = self.slug.parameterize
  end
end
