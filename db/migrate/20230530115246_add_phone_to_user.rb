class AddPhoneToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :spree_users, :phone, :text 
  end
end
