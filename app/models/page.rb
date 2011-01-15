class Page < ActiveRecord::Base
  validates :slug, :presence => true, :uniqueness => true
  validates :slug, :format => { :with => /^[-A-Za-z0-9\d_]+$/ }
  
  def to_param
    slug.parameterize
  end
end
