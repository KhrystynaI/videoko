module Spree
  class MutualSettlementsController < Spree::StoreController
    before_action :check_user

    def show_user_mutual_settlement
      @mutual_settlement = Spree::MutualSettlement.find(params[:id])
      all_documents = []
      all_documents.push(@mutual_settlement.sales_invoices.to_a.flatten(1))
      all_documents.push(@mutual_settlement.income_invoices.to_a.flatten(1))
      all_documents.push(@mutual_settlement.return_invoices.to_a.flatten(1))
      all_documents_sorted = all_documents.reduce([], :concat)
      @documents = all_documents_sorted.sort_by { |c|c.created_at}
      respond_to do |format|
      format.html
      format.pdf do
        pdf = MutualSettlementPdf.new(@mutual_settlement, @documents)
        send_data pdf.render, filename: 'взаєморозрахунки.pdf', type: 'application/pdf'
      end
    end
    end

    def user_list_mutual_settlements
      if !spree_current_user.mutual_settlements.nil?
        curr_page = params[:page] || 1
        @mutual_settlements = spree_current_user.mutual_settlements.page(curr_page).per(10)
      else
        flash[:notice] = Spree.t(:empty)
        redirect_to "/account"
      end
    end


    def message_mutual_settlement
      @user = params[:user]
      @message = params[:message]
      MutualSettlementRequestMailer.inform_admin_mutual_settlement(@user, @message).deliver_later
      respond_to do |format|
      format.html
      format.js
    end
    end

    private

    def check_user
      if spree_current_user.has_spree_role?("rozdrib")
        redirect_to root_path
      end
    end

  end
end
