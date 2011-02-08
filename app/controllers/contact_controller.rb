class ContactController < ApplicationController
  def index
  end

  def create
    ContactMailer.contact_message(params, current_user).deliver
    
    redirect_to(root_path, :notice => 'Your message has been delivered')
  end

end
