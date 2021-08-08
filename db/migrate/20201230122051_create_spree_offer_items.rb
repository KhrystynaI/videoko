class CreateSpreeOfferItems < ActiveRecord::Migration[6.0]
  def change
    create_table :spree_offer_items do |t|
      t.belongs_to :variant
      t.belongs_to :offer
      t.integer :quantity
      t.decimal :price, precision: 10, scale: 2
      t.timestamps
    end
  end
end
