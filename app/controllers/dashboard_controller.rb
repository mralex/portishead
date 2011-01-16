class DashboardController < ApplicationController
  before_filter :login_required
  
  def index
    @projects = Project.order(:position)
    @categories = Category.all
    @pages = Page.all
    @images = Image.all
  end

end
