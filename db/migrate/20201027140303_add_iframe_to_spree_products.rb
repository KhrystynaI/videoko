class AddIframeToSpreeProducts < SpreeExtension::Migration[4.2]
  def change
    add_column :spree_products, :iframe, :string
  end
end
