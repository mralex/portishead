class ImagesController < ApplicationController
  def index
  end

  def show
    @image = Image.find(params['id'])
    
    render :json => @image
  end

  def sort
    @project = Project.find_by_slug(params['project_id'])
    @project.visible_images.each do |image|
      image.position = params['image'].index(image.id.to_s) + 1
      image.save
    end
    
    render :nothing => true
  end

end
