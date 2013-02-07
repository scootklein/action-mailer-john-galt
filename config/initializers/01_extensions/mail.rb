module Mail
  class Message
    alias_method :deliver_email, :deliver 

    def deliver
      case self.to
      when Phone
        deliver_phone_text
      when Device
        deliver_device_push
      else
        deliver_email
      end
    end

    def deliver_phone_text
      Text.create_and_deliver(self.to.country, self.to.number, self.body.decoded.strip, self.from.first)
    end

    def deliver_device_push
      Push.create_and_deliver(self.to.token, self.body.decoded.strip)
    end
  end
end

# need to override/define some methods that are going to be set
# on the 'to:' field
[Device, Phone].each do |klass|
  klass.class_eval do
    def ascii_only?; true; end
    def encoding; nil; end
    def encode!(arg); nil; end
    def index(arg); nil; end
  end
end
