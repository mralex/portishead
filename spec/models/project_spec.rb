require 'spec_helper'

describe Project do
  it "should make a slug from the name" do
    project = Factory(:project, :name => "Project Name")
    project.slug.should == "project-name"
  end
  
  it "should include the slug in to_param" do
    project = Factory(:project, :name => "Project Name")
    project.to_param.should == "project-name"
  end
  
  it "should have a category" do
    project = Factory(:project)
    project.should_not have(1).error_on(:category)
    project.category.name.should == "Category"
  end
  
  it "should find images" do
    project = Factory(:project)
    image1 = project.images.create!(:title => "image 1")
    image2 = project.images.create!(:title => "image 2")
    
    project.images.length.should == 2
    project.images.should == [image1, image2]
  end
  
  it "should find visible images" do
    project = Factory(:project)
    image1 = project.images.create!(:title => "image 1", :hidden => true)
    image2 = project.images.create!(:title => "image 2", :hidden => false)
    
    project.visible_images.should == [image2]
  end
  
  it "should find hero image" do
    Project.delete_all
    project = Factory(:project)
    image1 = project.images.create!(:title => "image 1", :hero => true)
    image2 = project.images.create!(:title => "image 2", :hero => false)
    
    project.hero.should == image1
  end
end
