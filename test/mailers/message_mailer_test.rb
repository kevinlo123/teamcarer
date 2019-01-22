require 'test_helper'

class MessageMailerTest < ActionMailer::TestCase
  test "contact_me" do
    mail = MessageMailer.contact_me
    assert_equal "Contact me", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
