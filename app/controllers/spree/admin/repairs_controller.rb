module Spree
  module Admin
    class RepairsController < Spree::Admin::BaseController

      def index_repairs
        curr_page = params[:page] || 1
        @repairs = Spree::Repair.all.order("updated_at DESC").page(curr_page).per(15)
      end

      def new_repair
        @repair = Spree::Repair.new()
      end

      def create_repair
        @repair = Spree::Repair.new(
          user_id: params[:repair][:user_id],
          status: params[:repair][:status],
          number: params[:repair][:number],
          phone: params[:repair][:phone],
          comment: params[:repair][:comment]
          )
        if @repair.save
          redirect_to admin_show_repair_path(@repair.id)
        else
          flash[:error] = "Поля користувач, статус, номер квитанції та телефон не можуть бути пустими"
          redirect_to admin_new_repair_path
        end
      end

      def show_repair
        @repair = Spree::Repair.find(params[:id])
      end

      def edit_repair
        @repair = Spree::Repair.find(params[:id])
      end

      def update_repair
        status_params = params[:repair][:status]
        repair = Spree::Repair.find(params[:repair][:id])
        prev_status = repair.status
        repair.update(
          status: params[:repair][:status],
          number: params[:repair][:number],
          phone: params[:repair][:phone],
          comment: params[:repair][:comment]
        )
        if prev_status != status_params
          status_code = {"in_progress" => "В ремонті",
                    "waiting_for_parts" => "Очікуємо на запчастини",
                    "sent_to_manufacturer" => "Відправлено виробникові",
                    "repaired" => "Відремонтовано",
                    "without_repair" => "Без ремонту"}
          status_final = status_code.select{|k,v| k == repair.status}.values.first

          StatusRepairMailer.inform_user_repair(user: repair.user.id, message: repair.status, comment: repair.comment).deliver_later
          sns = Aws::SNS::Client.new(region: 'us-east-2', access_key_id: Rails.application.credentials[:sns][:access_key_id], secret_access_key: Rails.application.credentials[:sns][:secret_access_key])
          sns.publish(phone_number: repair.phone,
                      message: "Шановна/ий #{repair.user.full_name}, статус ремонту Вашого обладнання змінився на: '#{status_final}' ")
        end
        redirect_to admin_show_repair_path(id: repair.id)
      end

      def delete_repair
        repair = Spree::Repair.find(params[:id])
        repair.delete
        redirect_to admin_index_repairs_path
      end

      def find_repair_phone
        phone = Spree::Repair.where(phone: params[:phone])
        if !phone.blank?
        render template: "spree/admin/repairs/find_repair_phone", locals: {repairs: phone}
        else
        flash[:notice] = "Запису не знайдено"
        redirect_to admin_index_repairs_path
        end
      end

      def find_repair_number
        number = Spree::Repair.find_by(number: params[:number])
        if !number.blank?
        redirect_to admin_show_repair_path(number.id)
        else
        flash[:notice] = "Запису не знайдено"
        redirect_to admin_index_repairs_path
        end
      end
    end
  end
end
