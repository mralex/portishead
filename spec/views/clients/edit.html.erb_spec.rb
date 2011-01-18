require 'spec_helper'

describe "clients/edit.html.erb" do
  before(:each) do
    @client = assign(:client, stub_model(Client,
      :name => "MyString",
      :slug => "MyString",
      :description => "MyString",
      :url => "MyString"
    ))
  end

  it "renders the edit client form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => client_path(@client), :method => "post" do
      assert_select "input#client_name", :name => "client[name]"
      assert_select "input#client_slug", :name => "client[slug]"
      assert_select "input#client_description", :name => "client[description]"
      assert_select "input#client_url", :name => "client[url]"
    end
  end
end
