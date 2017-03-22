require 'action_mailer'
require 'smtp2go'

module Smtp2go
  class Smtp2goMailer < ActionMailer::Base
    def send
      smtp2go_client = Smtp2go::Smtp2goClient.new
      smtp2go_client.send
    end
  end
end
