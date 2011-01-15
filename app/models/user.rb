class User < ActiveRecord::Base
  validates_presence_of :name, :on => :update
  validates_presence_of :email, :on => :update
  
  def self.create_with_omniauth(auth)
    create! do |u|
      u.provider = auth["provider"]
      u.uid = auth["uid"]
      u.name = auth["user_info"]["name"]
      u.email = auth["user_info"]["email"]
    end
  end
end
