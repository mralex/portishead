require 'spec_helper'

describe Image do
  it "should find visible" do
    visible = Factory(:image, :hidden => false)
    hidden = Factory(:image, :hidden => true)
    Image.visible.should include(visible)
    Image.visible.should_not include(hidden)
  end
  
  it "should find hero" do
    normal = Factory(:image, :hero => false)
    hero = Factory(:image, :hero => true)
    Image.hero.should include(hero)
    Image.hero.should_not include(normal)
  end
  
  it "should require a title" do
    image = Image.new
    image.should have(1).error_on(:title)
  end
    
end
