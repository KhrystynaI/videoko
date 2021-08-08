class CreateSpreeSalesInvoices < ActiveRecord::Migration[6.0]
  def change
    create_table :spree_sales_invoices do |t|
      t.belongs_to :mutual_settlement
      t.string :name
      t.string :type_config, default: "sales"
      t.date :date
      t.decimal :debt_usd, precision: 10, scale: 2
      t.decimal :debt_uah, precision: 10, scale: 2
      t.decimal :debt_total_usd, precision: 10, scale: 2
      t.decimal :debt_total_uah, precision: 10, scale: 2
      t.timestamps
    end
  end
end
