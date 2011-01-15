class ImagesController < ApplicationController
  def index
  end

  def show
  end

  def sort
    @project = Project.find_by_slug(params['project_id'])
    @project.images.each do |image|
      image.position = params['image'].index(image.id.to_s) + 1
      image.save
    end
    
    render :nothing => true
  end

end
