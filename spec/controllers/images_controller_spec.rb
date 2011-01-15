require 'spec_helper'

describe ImagesController do

  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'show'" do
    it "should be successful" do
      get 'show'
      response.should be_success
    end
  end

  describe "GET 'sort'" do
    it "should be successful" do
      get 'sort'
      response.should be_success
    end
  end

end
