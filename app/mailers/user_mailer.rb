class UserMailer < ApplicationMailer
  default from: "definetlynotspam@spammail.com"

  def delete_email(user)
    @user = user
    @url = 'http://example.com/login'
    mail(to: @user.email, subject: 'You just got deleted homeboi').deliver
  end
end
