require 'spec_helper'

describe User do
  it "should create from omniauth response" do
    omniauth = {"provider" => "twitter", "uid" => "42", "user_info" => {"name" => "Foo Bar"}}
    
    user = User.create_with_omniauth(omniauth)
    
    user.provider.should == "twitter"
    user.uid.should == "42"
    user.name.should == "Foo Bar"
  end
end
