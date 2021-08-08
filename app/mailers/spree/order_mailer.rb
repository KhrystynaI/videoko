module Spree
  class OrderMailer < BaseMailer
    helper Spree::MailHelper
    def confirm_email(order, resend = false)
      @order = order.respond_to?(:id) ? order : Spree::Order.find(order)
      current_store = @order.store
      subject = (resend ? "[#{Spree.t(:resend).upcase}] " : '')
      subject += "#{current_store.name} #{Spree.t('order_mailer.confirm_email.subject')} ##{@order.number}"
      mail(to: @order.email, from: "noreply@videoko.com.ua", subject: subject)
    end

    def inform_admin(order)
       @order = order.respond_to?(:id) ? order : Spree::Order.find(order)
       mail(to: Spree::Config[:email_admin], from: "noreply@videoko.com.ua", subject: "Нове замовлення")
    end

    def confirm_email_offer(offer)
      @offer = Spree::Offer.find(offer)
      subject = Spree::Store.last.name
      mail(to: @offer.user.email, from: "noreply@videoko.com.ua", subject: subject)
    end

    def inform_admin_offer(offer)
       @offer = Spree::Offer.find(offer)
       mail(to: Spree::Config[:email_admin], from: "noreply@videoko.com.ua", subject: "Нове замовлення")
    end

    def cancel_email(order, resend = false)
      @order = order.respond_to?(:id) ? order : Spree::Order.find(order)
      current_store = @order.store
      subject = (resend ? "[#{Spree.t(:resend).upcase}] " : '')
      subject += "#{current_store.name} #{Spree.t('order_mailer.cancel_email.subject')} ##{@order.number}"
      mail(to: @order.email, from: "noreply@videoko.com.ua", subject: subject)
    end
  end
end
