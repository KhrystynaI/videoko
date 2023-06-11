class ConfirmMailer < ApplicationMailer
  def send_confirmation(args)
    user = Spree::User.find(args[:user])
    @user_name = user.full_name
    @confirmation_token = user.confirmation_token
    @user_email = user.email

    mail(to: @user_email, from: "videoko2016@gmail.com", subject: "Підтвердження акаунту")
  end
end
