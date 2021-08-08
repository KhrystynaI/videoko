class CreateSpreeReturnInvoice < ActiveRecord::Migration[6.0]
  def change
    create_table :spree_return_invoices do |t|
      t.belongs_to :mutual_settlement
      t.string :name
      t.string :type_config, default: "return"
      t.date :date
      t.decimal :income_usd, precision: 10, scale: 2
      t.decimal :income_uah, precision: 10, scale: 2
      t.decimal :income_total_usd, precision: 10, scale: 2
      t.decimal :income_total_uah, precision: 10, scale: 2
      t.timestamps
    end
  end
end
