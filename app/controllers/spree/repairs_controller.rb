module Spree
  class RepairsController < Spree::StoreController

    def find_repair_phone_user
      @phone = spree_current_user.repairs.where(phone: params[:phone])
      if !@phone.blank?
        respond_to do |format|
        format.html{}
        format.js{  }
      end
      else
        respond_to do |format|
          format.html{}
          format.js{ render "spree/repairs/not_find.js.erb" }
        end
      end
    end

    def find_repair_number_user
      @number = spree_current_user.repairs.find_by(number: params[:number])
      if !@number.blank?
        respond_to do |format|
        format.html{}
        format.js{  }
      end
      else
        respond_to do |format|
          format.html{}
          format.js{ render "spree/repairs/not_find.js.erb" }
        end
      end
    end


  end
end
