class ContactController < ApplicationController
  def index
  end

  def create
    # FIXME: Add some better server-side validations
    if (params[:email].blank? || params[:message].blank?)
      redirect_to contact_index_path, :notice => "Please enter an email address and message!"
      return
    end
    
    ContactMailer.contact_message(params, User.first).deliver
    
    redirect_to(root_path, :notice => 'Your message has been delivered')
  end

end
