class CreateSpreeInvoiceItems < ActiveRecord::Migration[6.0]
  def change
    create_table :spree_invoice_items do |t|
      t.belongs_to :sales_invoice
      t.belongs_to :return_invoice
      t.integer :quantity
      t.decimal :final_price, precision: 10, scale: 2
      t.decimal :price, precision: 10, scale: 2
      t.string :name
      t.timestamps
    end
  end
end
