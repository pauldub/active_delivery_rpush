# lib/line.rb


module ActiveDeliveryRpush
  class Line < ActiveDelivery::Lines::Base
    def resolve_class(name)
      name.gsub(/Delivery$/, "Notification").safe_constantize
    end

    def notify?(delivery_action)
      handler_class.respond_to?(delivery_action)
    end

    def notify_now(sender, delivery_action, *args)
      sender.public_send(delivery_action, *args).notify_now
    end

    def notify_later(sender, delivery_action, *args)
      sender.public_send(delivery_action, *args).notify_later
    end
  end
end
