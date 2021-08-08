module Spree
  module Admin
    class MutualSettlementsController < Spree::Admin::BaseController

      def index
        @users = Spree::User.all.reject{|c|c.has_spree_role?(:rozdrib)}.reject{|c|c.has_spree_role?(:admin)}
      end

      def upload_mutual_settlement
        mutual_file = params[:file]
          File.open(Rails.root.join('upload',mutual_file.original_filename), 'wb') do |file|
            file.write(mutual_file.read)
        end
        file = mutual_file.original_filename
        UpdateMutualSettlementJob.perform_later(file)
        redirect_to admin_mutual_settlements_path, notice: "Таблиця завантежена, триває опрацювання"
      end

      def list_mutual_settlements
        curr_page = params[:page] || 1
        @user = Spree::User.find(params[:id])
        @mutual_settlements = @user.mutual_settlements.page(curr_page).per(15)
      end

      def add_new_table
        @user = Spree::User.find(params[:id])
      end

      def add_date_to_new_table
        @user = Spree::User.find(params[:user])
        @mutual_settlement = Spree::MutualSettlement.new(user: @user, date_from: params[:date_from], date_to: params[:date_to])
        if @mutual_settlement.save!
          render template: "spree/admin/mutual_settlements/add_date_to_new_table"
        else
          flash[:error] = "дати не можуть бути пустими"
          redirect_to admin_add_new_table_path
        end
      end

      def delete_mutual_settlement
        mutual_settlement = Spree::MutualSettlement.find(params[:id])
        user_id = mutual_settlement.user.id
        mutual_settlement.return_invoices.each{|item| item.invoice_items.each{|c|c.delete}}
        mutual_settlement.return_invoices.each{|item| item.delete}
        mutual_settlement.sales_invoices.each{|item| item.invoice_items.each{|c|c.delete}}
        mutual_settlement.sales_invoices.each{|item| item.delete}
        mutual_settlement.income_invoices.each{|item| item.delete}
        mutual_settlement.delete
        redirect_to admin_list_mutual_settlements_path(id: user_id)
      end

      def show
        @mutual_settlement = Spree::MutualSettlement.find(params[:id])
        @user = @mutual_settlement.user
        all_documents = []
        all_documents.push(@mutual_settlement.sales_invoices.to_a.flatten(1))
        all_documents.push(@mutual_settlement.income_invoices.to_a.flatten(1))
        all_documents.push(@mutual_settlement.return_invoices.to_a.flatten(1))
        all_documents_sorted = all_documents.reduce([], :concat)
        @documents = all_documents_sorted.sort_by { |c|c.created_at}
      end

    end
  end
end
