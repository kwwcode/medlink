class Patient < ActiveRecord::Base
  attr_accessible :dob, :surname, :first_name, :notes, :phone, :symptoms

  def self.find_or_create(phone_number, first_name, last_name)
  	p = Patient.find_by_phone(phone_number)
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
  	return self.first_name+" "+self.surname
  end
end
