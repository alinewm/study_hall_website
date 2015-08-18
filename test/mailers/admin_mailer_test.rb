require 'test_helper'

class AdminMailerTest < ActionMailer::TestCase
  test "new_question_notifier" do
    mail = AdminMailer.new_question_notifier
    assert_equal "New question notifier", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
