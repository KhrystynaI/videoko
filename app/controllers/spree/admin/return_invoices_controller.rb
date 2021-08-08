module Spree
  module Admin
    class ReturnInvoicesController < Spree::Admin::BaseController

      def new_return
        @mutual = params[:mutual]
        @return_invoice = Spree::ReturnInvoice.new()
      end

      def create_return
        if !params[:return_invoice][:invoice_items_attributes].nil?
        @return_invoice = Spree::ReturnInvoice.create(mutual_settlement_id: params[:return_invoice][:mutual_settlement],
         name: params[:return_invoice][:name],
         date: params[:return_invoice][:date],
         income_total_usd: params[:return_invoice][:income_total_usd].to_f
          )
        params[:return_invoice][:invoice_items_attributes].each do |item|
        Spree::InvoiceItem.create(name: item[1]["name"], quantity: item[1]["quantity"],
         price: item[1]["price"],
         return_invoice_id: @return_invoice.id)
      end
      @return_invoice.invoice_items.each do |item|
        item.update(final_price: item.quantity*item.price)
      end
      sum = @return_invoice.invoice_items.map{|c|c.final_price}.sum
      @return_invoice.update(income_usd: sum)
      redirect_to admin_show_return_invoice_path(id: @return_invoice.id)
      else
        flash[:error] = "має бути доданий хоча б один товар"
        redirect_to admin_new_return_invoice_path(mutual: params[:return_invoice][:mutual_settlement])
      end
      end

      def show_return
        @return_invoice = Spree::ReturnInvoice.find(params[:id])
      end

      def delete_return
        return_invoice = Spree::ReturnInvoice.find(params[:id])
        return_invoice.invoice_items.each{|item| item.delete}
        return_invoice.delete
        redirect_to admin_show_mutual_settlement_path(id: return_invoice.mutual_settlement.id)
      end

  end
 end
end
