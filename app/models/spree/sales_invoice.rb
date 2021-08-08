module Spree
  class SalesInvoice < Spree::Base
    belongs_to :mutual_settlement, class_name: 'Spree::MutualSettlement'
    has_many :invoice_items, class_name: 'Spree::InvoiceItem', inverse_of: :sales_invoice
    accepts_nested_attributes_for :invoice_items, reject_if: :all_blank, allow_destroy: true
  end
end
