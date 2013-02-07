class SubscriberMailer < ActionMailer::Base
  default from: "scott@statuspage.io"

  def confirmation(subscriber)
    @subscriber = subscriber

    mail(
      to: subscriber.email, 
      subject: "Thanks for signing up for #{subscriber.organization.name} notifications!"
    )
  end
end
