class AddDateFromToMutualSettlement < ActiveRecord::Migration[6.0]
  def change
    add_column :spree_mutual_settlements, :date_from, :date
    add_column :spree_mutual_settlements, :date_to, :date
  end
end
