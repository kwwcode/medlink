class Patient < ActiveRecord::Base
  attr_accessible :dob, :surname, :first_name, :notes, :phone, :symptoms, :email
  validates_uniqueness_of :phone, :email, :allow_blank => true, :allow_nil => true

  validates :email, :presence => {:unless => Proc.new { |a| a.phone.present? } , :message => "You must enter a phone number or email address"}

  has_many :requests

  def self.find_or_create(phone_number, first_name, last_name, email)
    p = nil 
  	p = !phone_number.blank? ? Patient.find_by_phone(phone_number) : Patient.find_by_email(email)
  	if(!p)
  		p = Patient.new
  		p.phone = phone_number
  		p.first_name = first_name
  		p.surname = last_name
  		p.save
  	end 
  	return p
  end

  def full_name
  	"#{self.first_name} #{self.surname}"
  end

  def display_information
    "#{full_name} #{phone}"
  end
end
