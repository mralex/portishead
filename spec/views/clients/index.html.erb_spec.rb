require 'spec_helper'

describe "clients/index.html.erb" do
  before(:each) do
    assign(:clients, [
      stub_model(Client,
        :name => "Name",
        :slug => "Slug",
        :description => "Description",
        :url => "Url"
      ),
      stub_model(Client,
        :name => "Name",
        :slug => "Slug",
        :description => "Description",
        :url => "Url"
      )
    ])
  end

  it "renders a list of clients" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Slug".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Url".to_s, :count => 2
  end
end
