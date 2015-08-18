class AdminMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.admin_mailer.new_question_notifier.subject
  #
  def new_question_notifier
    @admin = User.find_by_role(2) # Just returns a single admin -> at the moment, there's only a single admin
    mail to: admin.email, subject: "New question!"
  end
end
