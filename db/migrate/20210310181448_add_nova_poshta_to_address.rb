class AddNovaPoshtaToAddress < ActiveRecord::Migration[6.0]
  def change
    add_column :spree_addresses, :nova_poshta_address, :string
    add_column :spree_addresses, :nova_poshta_number, :string
  end
end
