# lib/notifier.rb

require 'abstract_notifier/base'

module ActiveDeliveryRpush
  class Notifier < AbstractNotifier::Base
    def notification(**payload)
      merge_defaults!(payload)
      AbstractNotifier::Notification.new(self.class, payload)
    end
  end
end
