class ContactMailer < ActionMailer::Base
  def contact_message(params, user)
    @params = params
    mail(:to => user.email, :from => "#{params[:name]} <#{params[:email]}>", :subject => "Contact Message")
  end
end
