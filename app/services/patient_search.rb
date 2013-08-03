class PatientSearch
  def initialize(params)
    @type, @value = params[:type], params[:value]
  end

  def search
    Patient.where("lower(#{@type}) = ?", @value.downcase)
  end

  def self.search_options
    options = [
      ["First Name", "first_name"], 
      ["Surname", "surname"], 
      ["Phone", "phone"]
    ]
    default = ["Phone", "phone"]
    [options, default]
  end
end

