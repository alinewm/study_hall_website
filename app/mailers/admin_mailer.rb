class AdminMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.admin_mailer.new_question_notifier.subject
  #
  def new_question_notifier(user, question) # Clean up, not that intuitive
    @user = user
    @question = question
    @admin = User.admin.first # User.admin returns array
    mail to: @admin.email, subject: "New question!"
  end
end
