class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome(user, token, message = "", sender = nil)
    @user = user
    @token = token
    @message = message
    mail to: user.email, subject: "Welcome to Klogskabet CMS", reply_to: sender.try(:email)
  end
end
