class AddProductToVolumes < ActiveRecord::Migration[6.0]
  def change
    add_belongs_to(:spree_volumes, :product)
  end
end
