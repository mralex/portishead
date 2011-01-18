require 'spec_helper'

describe "clients/show.html.erb" do
  before(:each) do
    @client = assign(:client, stub_model(Client,
      :name => "Name",
      :slug => "Slug",
      :description => "Description",
      :url => "Url"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Slug/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Description/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Url/)
  end
end
