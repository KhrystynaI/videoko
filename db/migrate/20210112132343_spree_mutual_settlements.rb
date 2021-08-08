class SpreeMutualSettlements < ActiveRecord::Migration[6.0]
  def change
    create_table :spree_mutual_settlements do |t|
    t.belongs_to :user
    t.decimal :total_number_usd, precision: 10, scale: 2, default: 0
    t.decimal :total_number_uah, precision: 10, scale: 2, default: 0
    t.timestamps
  end
  end
end
