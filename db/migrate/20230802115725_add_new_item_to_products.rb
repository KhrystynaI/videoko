class AddNewItemToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :spree_products, :new_item, :boolean, default: false
  end
end
