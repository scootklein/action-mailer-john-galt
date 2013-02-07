class Subscriber < ActiveRecord::Base
  belongs_to :organization

  attr_accessible :email, :phone_country, :phone_number, :push_identifier, :unsubscribe_code

  after_create :send_confirmation

  def send_confirmation
    self.communication_class.confirmation(self).deliver
  end

  def communication_class
    if email
      SubscriberMailer
    elsif self.phone_number
      SubscriberTexter
    elsif self.push_identifier
      SubscriberPusher
    end
  end

  def to_phone
    Phone.new(self.phone_country, self.phone_number)
  end

  def to_device
    Device.new(self.push_identifier)
  end
end
