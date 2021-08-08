class AddSkuToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :spree_users, :sku, :string
  end
end
