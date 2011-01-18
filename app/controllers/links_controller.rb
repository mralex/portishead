class LinksController < ApplicationController
  def index
  end

  def show
  end

  def sort
    @project = Project.find_by_slug(params['project_id'])
    @project.links.each do |link|
      link.position = params['link'].index(link.id.to_s) + 1
      link.save
    end
    
    render :nothing => true
  end

end
