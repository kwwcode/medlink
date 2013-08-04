class RequestsController < InheritedResources::Base
  before_filter :authenticate_admin_user!

  def notifications
    @requests = Request.all
  end

  def create
    if Request.create!(params[:request])
      flash[:notice] = "Request successfully created."
      redirect_to new_request_path
    end
  end

  def send_all
    amount_sent = 0
    if params[:requests].present?
      amount_sent = Request.send_batch(params[:requests])
    end

    message = "#{amount_sent} notifications sent"
    amount_sent > 0 ? flash[:notice] = message : flash[:error] = message
    redirect_to requests_notifications_path
  end

  def index
    @requests = Request.find(:all, :conditions => {:status => "open"})
    @requested  = Request.find(:all, :conditions => {:status => "requested"})
    @delivered = Request.find(:all, :conditions => {:status => "delivered"})
  end
end
