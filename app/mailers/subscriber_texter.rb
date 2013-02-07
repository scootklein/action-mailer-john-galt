class SubscriberTexter < ActionMailer::Base
  default from: "+19198675309"

  def confirmation(subscriber)
    @subscriber = subscriber

    mail(to: subscriber.to_phone)
  end
end
