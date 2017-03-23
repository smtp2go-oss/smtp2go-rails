require 'test_helper'

class Smtp2go::Rails::Test < ActiveSupport::TestCase
  test "it has a version number" do
    assert_kind_of Module, Smtp2go::Rails
  end

  test "it sends successfully using class default values" do
    VCR.use_cassette('send_email') do
      mailer = DefaultValuesTestMailer.new
      assert_equal mailer.mail, true
    end
  end

  test "it sends successfully using arguments values" do
    VCR.use_cassette('send_email') do
      mailer = DefaultValuesTestMailer.new
      assert_equal mailer.mail(
        {
          :to => ['dave@example.com'],
          :from => 'matt@example.com',
          :subject => 'Test Message',
          :body => 'Test Content'
        }
      ), true
    end
  end

  test "it returns false in the event of a failed response" do
    VCR.use_cassette('failed_send_email') do
      mailer = DefaultValuesTestMailer.new
      assert_equal mailer.mail, false
    end

  end
end
