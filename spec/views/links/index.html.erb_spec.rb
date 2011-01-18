require 'spec_helper'

describe "links/index.html.erb" do
  before(:each) do
    assign(:links, [
      stub_model(Link,
        :title => "Title",
        :url => "Url",
        :project_id => 1
      ),
      stub_model(Link,
        :title => "Title",
        :url => "Url",
        :project_id => 1
      )
    ])
  end

  it "renders a list of links" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
