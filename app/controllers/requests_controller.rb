class RequestsController < InheritedResources::Base
  before_filter :authenticate_admin_user!

  def sendout
  end

  def sendoutemail
  	email = params[:email_address]
  end
end
