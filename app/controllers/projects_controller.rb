class ProjectsController < ApplicationController
  before_filter :login_required, :except => [:index, :show, :heroes]
  
  def sort
    Project.all.each do |p|
      p.position = params['project'].index(p.id.to_s) + 1
      p.save
    end
    
    render :nothing => true
  end
  
  def heroes
    @projects = Project.order(:position)
    #render :js => @projects
  end
  
  # GET /projects
  # GET /projects.xml
  def index
    @projects = Project.order(:position)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @projects }
    end
  end

  # GET /projects/1
  # GET /projects/1.xml
  def show
    @project = Project.find_by_slug(params[:id])
    @images = @project.visible_images.order(:position)
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @project }
    end
  end

  # GET /projects/new
  # GET /projects/new.xml
  def new
    @project = Project.new
    
    @project.build_client
    @project.build_category
    
    @project.links.build
    
    3.times do
      @project.images.build
    end
    @project.images.first.hero = true

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @project }
    end
  end

  # GET /projects/1/edit
  def edit
    @project = Project.find_by_slug(params[:id])
    @project.build_client
    @project.build_category
    
    @project.links.build if @project.links.count == 0
    @project.images.build if @project.images.count == 0
    
  end

  # POST /projects
  # POST /projects.xml
  def create
    @project = Project.new(params[:project])

    respond_to do |format|
      if @project.save
        format.html { redirect_to(@project, :notice => 'Project was successfully created.') }
        format.xml  { render :xml => @project, :status => :created, :location => @project }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @project.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /projects/1
  # PUT /projects/1.xml
  def update
    @project = Project.find_by_slug(params[:id])

    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to(@project, :notice => 'Project was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @project.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.xml
  def destroy
    @project = Project.find_by_slug(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to(projects_url) }
      format.xml  { head :ok }
    end
  end
end
