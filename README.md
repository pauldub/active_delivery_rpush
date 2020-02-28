# ActiveDeliveryRpush

Provides an [ActiveDelivery](https://github.com/palkan/active_delivery/) line
for [rpush](https://github.com/rpush/rpush/) notifications.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'active_delivery_rpush'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install active_delivery_rpush

## Usage

Register the rpush line with your `ApplicationDelivery`:

``` ruby
class ApplicationDelivery < ActiveDelivery::Base
  register_line :rpush, ActiveDeliveryRpush::Line
end
```

The rpush line will resolves `Notification` suffixed classes, for example:
`PostNotification`.

You will need to setup your notification driver, depending on which provider you
want to use:

``` ruby
class FcmNotification < ActiveDeliveryRpush::Notifier
  # Use the active_delivery_rpush driver with GCM notifications
  self.driver = ActiveDeliveryRpush::Driver.new(
    Rpush::Gcm::Notification
  )
end
```

Finally, you can implement you notifications:

``` ruby
class PostNotification < FcmNotification
  def created(post)
    # Note: the `body` parameter is not required.
    notification(
      app: Rpush::Gcm::App.find_by(name: 'android'),
      registration_ids: params[:user].devices.pluck(
        :registration_id
      ),
      notification: {
        title: "New post",
        body: "#{post.title} has been published by #{post.author}!"
      },
    )
  end
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/pauldub/active_delivery_rpush.


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
