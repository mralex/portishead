require 'spec_helper'

describe ImagesController do
  describe "POST 'sort'" do
    it "should be successful" do
      project = Factory(:project)
      project.stubs(:is_valid).returns(true)
      image1 = Image.create!(:title => "Foo", :position => 1)
      image2 = Image.create!(:title => "Foo", :position => 2)
      image1.project = project
      image2.project = project
      
      post 'sort', :image => [image2.id, image1.id], :project_id => project.slug
      response.should be_success
      image1.position.should == 2
    end
  end

end
