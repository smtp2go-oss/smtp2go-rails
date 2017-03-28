require 'test_helper'

class Smtp2go::Test < ActiveSupport::TestCase
  test 'it sends successfully using class default values' do
    VCR.use_cassette('send_email') do
      mailer = DefaultValuesTestMailer.new
      assert_equal mailer.mail, true
    end
  end

  test 'it sends successfully using arguments values' do
    VCR.use_cassette('send_email') do
      mailer = TestMailer.new
      payload = {
        to: ['matt@example.com'],
        from: 'dave@example.com',
        subject: 'Test Message',
        body: 'Test Content'
      }
      assert_equal mailer.mail(payload), true
    end
  end

  test 'it returns false in the event of a failed response' do
    VCR.use_cassette('failed_send_email') do
      mailer = DefaultValuesTestMailer.new
      assert_equal mailer.mail, false
    end
  end

  test 'it handles sending of multiple recipients' do
    VCR.use_cassette('send_email') do
      mailer = TestMailer.new
      payload = {
        to: ['matt@example.com, charlie@smtp2go.com'],
        from: 'dave@example.com',
        subject: 'Test Message',
        body: 'Test Content'
      }
      assert_equal mailer.mail(payload), true
    end
  end

  test 'it fails if the "to" field is absent' do
    # Return failed response:
    VCR.use_cassette('failed_send_email') do
      mailer = TestMailer.new
      payload = {
        from: 'dave@example.com',
        subject: 'Test Message',
        body: 'Test Content'
      }
      assert_not payload.key?(:to)
      assert_equal mailer.mail(payload), false
    end
  end

  test 'it fails if the "from" field is absent' do
    # Return failed response:
    VCR.use_cassette('failed_send_email') do
      mailer = TestMailer.new
      payload = {
        to: ['dave@example.com'],
        subject: 'Test Message',
        body: 'Test Content'
      }
      assert_not payload.key?(:from)
      assert_equal mailer.mail(payload), false
    end
  end

  test 'it fails if the "subject" field is absent' do
    # Return failed response:
    VCR.use_cassette('failed_send_email') do
      mailer = TestMailer.new
      payload = {
        to: ['matt@example.com'],
        from: 'dave@example.com',
        body: 'Test Content'
      }
      assert_not payload.key?(:subject)
      assert_equal mailer.mail(payload), false
    end
  end

  test 'it fails if the "body" field is absent' do
    # Return failed response:
    VCR.use_cassette('failed_send_email') do
      mailer = TestMailer.new
      payload = {
        to: ['matt@example.com'],
        from: 'dave@example.com',
        subject: 'Test Message'
      }
      assert_not payload.key?(:body)
      assert_equal mailer.mail(payload), false
    end
  end
end
