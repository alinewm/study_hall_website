require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "question_replied_notifier" do
    mail = UserMailer.question_replied_notifier
    assert_equal "Question replied notifier", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
