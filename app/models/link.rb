class Link < ActiveRecord::Base
  belongs_to :project, :dependent => :destroy
  
  acts_as_list
  
end
