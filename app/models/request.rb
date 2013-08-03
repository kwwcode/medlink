class Request < ActiveRecord::Base
  belongs_to :patient 
  has_one :user
  attr_accessible :date, :items, :patient_id, :user_id
  validates_presence_of :patient_id
end
