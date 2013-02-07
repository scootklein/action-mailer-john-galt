class Device
  attr_accessor :identifier, :type

  def initialize(identifier, type = nil)
    self.identifier = identifier
    self.type = type
  end
end
