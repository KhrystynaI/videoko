module Spree
  module Admin
    class IncomeInvoicesController < Spree::Admin::BaseController

      def new_income
        @mutual = params[:mutual_id]
        @income_invoice = Spree::IncomeInvoice.new()
      end

      def create_income
        income_usd = params[:income_invoice][:income_usd].to_f
        mutual_settlement = Spree::MutualSettlement.find(params[:income_invoice][:mutual_settlement])
        @income_invoice = Spree::IncomeInvoice.create(
          mutual_settlement_id: mutual_settlement.id,
          name: params[:income_invoice][:name],
          date: params[:income_invoice][:date],
          income_usd: income_usd,
          income_total_usd: params[:income_invoice][:income_total_usd].to_f
          )
        redirect_to admin_show_income_invoice_path(id: @income_invoice.id)
      end

      def show_income
        @income_invoice = Spree::IncomeInvoice.find(params[:id])
      end

      def delete_income
        income_invoice = Spree::IncomeInvoice.find(params[:id])
        income_invoice.delete
        redirect_to admin_show_mutual_settlement_path(id: income_invoice.mutual_settlement.id)
      end

    end
  end
end
