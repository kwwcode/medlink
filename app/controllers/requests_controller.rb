class RequestsController < InheritedResources::Base
  before_filter :authenticate_admin_user!

  def create
    @request = Request.new(params[:request])
    @patient = Patient.find_or_create(params[:patient_phone_number], params[:patient_first_name], params[:patient_last_name])
    @request.patient = @patient
    create!
  end

  def sendout
  end

  def sendoutemail
  	email = params[:email_address]
  end
end
