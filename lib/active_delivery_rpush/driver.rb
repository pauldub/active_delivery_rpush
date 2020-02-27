# lib/driver.rb

module ActiveDeliveryRpush
  class Driver
    def initialize(notification_klass)
      @notification_klass = notification_klass
    end

    def call(params)
      raise ArgumentError, "`app` must be passed as a param" unless params.fetch(:app, nil)

      notification = @notification_klass.new(
        params
      )

      notification.save!
    end
  end
end
