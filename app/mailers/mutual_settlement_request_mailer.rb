class MutualSettlementRequestMailer < ApplicationMailer
  def inform_admin_mutual_settlement(user, message)
    @user_name = Spree::User.find(user).full_name
    @message = message
    email = Spree::User.find(user).email
    mail(to: Spree::Config[:email_admin], from: email, subject: "")
  end
end
