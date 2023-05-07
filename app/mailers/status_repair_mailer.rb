class StatusRepairMailer < ApplicationMailer
  def inform_user_repair(args)
    @user_name = Spree::User.find(args[:user]).full_name
    @message = args[:message]
    @user_email = Spree::User.find(args[:user]).email
    @comment = args[:comment]
    mail(to: @user_email, from: "videoko2016@gmail.com", subject: "Новина про ремонт")
  end
end
