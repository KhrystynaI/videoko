class RemoveIframeFromeSpreeProducts < ActiveRecord::Migration[6.0]
  def change
    remove_column :spree_products, :iframe, :string
  end
end
