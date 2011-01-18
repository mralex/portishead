class DashboardController < ApplicationController
  before_filter :login_required
  
  def index
    @projects = Project.order(:position)
    @categories = Category.all
    @pages = Page.all
    @images = Image.order(:project_id)
    @links = Link.order(:position)
    @clients = Client.all
  end

end
