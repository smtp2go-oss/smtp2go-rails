require 'action_mailer'
require 'smtp2go'

module Smtp2go
  class Smtp2goMailer < ActionMailer::Base
    def mail(headers = {}, &block)
      data = self.class.default.merge headers
      payload = {
        :sender => data[:from],
        :recipients => data[:to],
        :subject => data[:subject],
        :message => data[:body]
      }
      smtp2go_client = Smtp2go::Smtp2goClient.new
      response = smtp2go_client.send payload
      return response.success? ? true : false
    end
  end
end
