require 'spec_helper'

describe "links/edit.html.erb" do
  before(:each) do
    @link = assign(:link, stub_model(Link,
      :title => "MyString",
      :url => "MyString",
      :project_id => 1
    ))
  end

  it "renders the edit link form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => link_path(@link), :method => "post" do
      assert_select "input#link_title", :name => "link[title]"
      assert_select "input#link_url", :name => "link[url]"
      assert_select "input#link_project_id", :name => "link[project_id]"
    end
  end
end
