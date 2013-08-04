class RequestsController < InheritedResources::Base
  before_filter :authenticate_admin_user!

  def notifications
    @requests = Request.all
  end

  def send_all
    Request.send_batch(params[:requests])
  end

  def index
    @requests = Request.find(:all, :conditions => {:status => "open"})
    @requested  = Request.find(:all, :conditions => {:status => "requested"})
    @delivered = Request.find(:all, :conditions => {:status => "delivered"})
  end
end
