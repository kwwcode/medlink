class Request < ActiveRecord::Base
  belongs_to :patient
  has_one :user
  attr_accessible :date, :items, :patient_id, :user_id
  after_initialize :init
  validates_presence_of :patient_id

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

  def self.send_batch(ids)
    ids.each do |request_id|
      Request.find(request_id).send_notification
    end
  end

  def send_notification
    if patient.phone?
      send_sms_notification
    else
      send_email_notification
    end
  end

  def send_sms_notification
    body = "Your medicine is ready for pick up. Please visit the Bansang Health Center as soon as possible."
    TwilioService.new.send_sms(patient, body)
  end

  def send_email_notification
    UserMailer.notification_email(patient.email).deliver
  end
end
