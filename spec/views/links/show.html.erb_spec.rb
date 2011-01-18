require 'spec_helper'

describe "links/show.html.erb" do
  before(:each) do
    @link = assign(:link, stub_model(Link,
      :title => "Title",
      :url => "Url",
      :project_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Url/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
