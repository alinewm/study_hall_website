# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/question_replied_notifier
  def question_replied_notifier
    UserMailer.question_replied_notifier
  end

end
