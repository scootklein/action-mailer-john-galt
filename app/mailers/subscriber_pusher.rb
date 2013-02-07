class SubscriberPusher < ActionMailer::Base
  def confirmation(subscriber)
    @subscriber = subscriber

    mail(to: subscriber.to_device)
  end
end
