class AddCountToSpreeProduct < SpreeExtension::Migration[4.2]
  def change
    add_column :spree_products, :count_size, :integer, default: 0
    add_column :spree_products, :existence, :boolean, default: false
  end
end
