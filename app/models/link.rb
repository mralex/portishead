class Link < ActiveRecord::Base
  belongs_to :project
  
  acts_as_list
  
end
