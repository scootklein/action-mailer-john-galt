class Phone
  attr_accessor :country, :number

  def initialize(country, number)
    self.country = country
    self.number = number
  end
end
