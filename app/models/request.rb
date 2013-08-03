class Request < ActiveRecord::Base
  belongs_to :patient 
  has_one :user
  attr_accessible :date, :items, :patient_id, :user_id
  after_initialize :init


  def init
  	self.status ||= "open"
  end

  def close_request
  	self.status = "requested"
  	self.save
  end

  def notify_request
    self.status = "delivered"
    self.save
  end

end
