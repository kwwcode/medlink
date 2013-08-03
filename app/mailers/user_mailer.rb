class UserMailer < ActionMailer::Base
  default :from => "rhokgambia@gmail.com"

  def inventory_email(user_email)  
    mail(:to => user_email, :subject => "RHOK Gambia Inventory Request")  
  end

  def notification_email(user_email)
  	@patient = Patient.find_by_email(user_email)
	mail(:to => user_email, :subject => "Your Medicines Have Arrived")
  end
end
