require 'spec_helper'

describe Page do
  it "should return the slug for to_param" do
    page = Factory(:page, :slug => "page-name")
    page.to_param.should == "page-name"
  end
end
