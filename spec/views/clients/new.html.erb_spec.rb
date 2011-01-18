require 'spec_helper'

describe "clients/new.html.erb" do
  before(:each) do
    assign(:client, stub_model(Client,
      :name => "MyString",
      :slug => "MyString",
      :description => "MyString",
      :url => "MyString"
    ).as_new_record)
  end

  it "renders new client form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => clients_path, :method => "post" do
      assert_select "input#client_name", :name => "client[name]"
      assert_select "input#client_slug", :name => "client[slug]"
      assert_select "input#client_description", :name => "client[description]"
      assert_select "input#client_url", :name => "client[url]"
    end
  end
end
