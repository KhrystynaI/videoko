class SpreeOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :spree_offers do |t|
      t.string :name
      t.integer :status, default: 1
      t.decimal :total_price, precision: 10, scale: 2
      t.text :comment
      t.string :price_role
      t.string :currency
      t.belongs_to :user
      t.belongs_to :order
      t.belongs_to :address
      t.timestamps
    end
  end
end
