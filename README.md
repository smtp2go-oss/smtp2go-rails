[![Build Status](https://travis-ci.org/smtp2go-oss/smtp2go-rails.svg?branch=master)](https://travis-ci.org/smtp2go-oss/smtp2go-rails)
[![Coverage Status](https://coveralls.io/repos/github/smtp2go-oss/smtp2go-rails/badge.svg?branch=master)](https://coveralls.io/github/smtp2go-oss/smtp2go-rails?branch=master)
[![Gem Version](https://badge.fury.io/rb/smtp2go.svg)](https://badge.fury.io/rb/smtp2go)
[![Dependency Status](https://gemnasium.com/badges/github.com/smtp2go-oss/smtp2go-rails.svg)](https://gemnasium.com/github.com/smtp2go-oss/smtp2go-rails)
[![Code Climate](https://codeclimate.com/github/smtp2go-oss/smtp2go-rails/badges/gpa.svg)](https://codeclimate.com/github/smtp2go-oss/smtp2go-rails)
[![Issue Count](https://codeclimate.com/github/smtp2go-oss/smtp2go-rails/badges/issue_count.svg)](https://codeclimate.com/github/smtp2go-oss/smtp2go-rails)
[![license](https://img.shields.io/github/license/smtp2go-oss/smtp2go-rails.svg)]()

# smtp2go-rails


Ruby on Rails library for interfacing with the [smtp2go](https://www.smtp2go.com) API.

> You might not need this gem at all! If you want to use smtp2go's SMTP server directly, simply add the following to your config/environment.rb:


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

And of course, if you're not using Ruby on Rails, we have a [Ruby](https://github.com/smtp2go-oss/smtp2go-ruby) version too.

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

Here is a short example that will send an email directly from a controller:

    require 'smtp2go'

    class StaticPagesController < ApplicationController
      def home
        payload = {
          :from => 'dave@example.com',
          :to => ['matt@example.com'],
          :subject => 'Testing the smtp2go Rails Client',
          :body => 'Test message.'
        }
        smtp2go_mailer = Smtp2go::Smtp2goMailer.new
        smtp2go_mailer.mail(payload)
      end
    end

You can subclass `Smtp2go::Smtp2goMailer` and add default values in the usual way:

    class DefaultValuesMailer < Smtp2go::Smtp2goMailer
      default :to => ['dave@example.com']
      default :from => 'matt@example.com'
      default :subject => 'Testing the smtp2go Rails Client'
      default :body => 'Test message'
    end

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/smtp2go-oss/smtp2go-rails.
