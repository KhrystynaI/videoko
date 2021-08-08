class AddEmptyPriceToProducts < SpreeExtension::Migration[4.2]
  def change
    add_column :spree_products, :empty_price, :boolean, default: false
  end
end
