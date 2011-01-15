require 'spec_helper'

describe ImagesController do
  describe "POST 'sort'" do
    it "should be successful" do
      Image.delete_all
      Project.delete_all
      
      Project.any_instance.stubs(:valid?).returns(true)
      project = Factory(:project)
            
      Image.any_instance.stubs(:valid?).returns(true)
      image1 = project.images.create! {|i| i.hidden = false }
      image2 = project.images.create! {|i| i.hidden = false }
      
      post :sort, { :image => [image2.id.to_s, image1.id.to_s], :project_id => project.to_param }
      response.should be_success
      project.images.last.position.should == 1
    end
  end

end
