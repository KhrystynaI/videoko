module Spree
  class InvoiceItem < Spree::Base
    belongs_to :sales_invoice, class_name: 'Spree::SalesInvoice', optional: true
    belongs_to :return_invoice, class_name: 'Spree::ReturnInvoice', optional: true
  end
end
