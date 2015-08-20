class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.question_replied_notifier.subject
  #
  def question_replied_notifier(user, question)
    @user = user
    @question = question
    mail to: @user.email, subject: "Your question has just been answered!"
  end
end
