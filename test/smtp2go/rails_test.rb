require 'test_helper'

class Smtp2go::Rails::Test < ActiveSupport::TestCase
  test "it has a version number" do
    assert_kind_of Module, Smtp2go::Rails
  end

  test "it sends successfully" do
    a = Smtp2go::Smtp2goMailer.new
    # a.send
  end
end
