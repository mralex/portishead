class UsersController < ApplicationController
  before_filter :login_required, :except => [:show, :create, :login, :logout]

  # GET /users/1
  # GET /users/1.xml
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(@user, :notice => 'User was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def create
    auth = request.env["omniauth.auth"]
    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"])
    
    # System only supports 1 user, so first come, first served
    if user == nil
      if User.count > 0
        redirect_to root_url, :notice => "Permission denied"
        return
      end
      
      user = User.create_with_omniauth(auth)
      session[:user_id] = user.id
      redirect_to edit_user_url(user), :notice => "Account created"
      return
    end
    
    session[:user_id] = user.id
    redirect_to root_url, :notice => "Signed in"
  end
  
  def login
    if Rails.env.development? && User.first
      session[:user_id] = User.first.id
      redirect_to root_url, :notice => "Signed in"
    else
      redirect_to "/auth/twitter"
    end
  end
  
  def logout
    session[:user_id] = nil
    redirect_to root_url, :notice => "Signed out"
  end
end
