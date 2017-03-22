# smtp2go-rails

Ruby on Rails library for interfacing with the (smtp2go)[https://www.smtp2go.com] API.

    You might not need this gem at all! If you want to use smtp2go's SMTP server directly, simply add the following to your config/environment.rb:


```ruby
config.action_mailer.perform_deliveries = true
config.action_mailer.delivery_method = :smtp
config.action_mailer.smtp_settings = {
  address:  'mail.smtp2go.com',
  port: 587,  # alternatively: 2525 or 80
  user_name: '<your smtp2go SMTP username>',
  password: '<your smtp2go SMTP password>',
  authentication: :cram_md5,
  enable_starttls_auto: true
}
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'smtp2go-rails'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install smtp2go-rails

## Usage

    This project should be considered in its alpha phase and should not be used.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/smtp2go.
