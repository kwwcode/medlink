class UserMailer < ActionMailer::Base
  default :from => "rhokgambia@gmail.com"

  def inventory_email(user_email)  
    mail(:to => user_email, :subject => "RHOK Gambia Inventory Request")  
  end
end
