module Spree
  class IncomeInvoice < Spree::Base
    belongs_to :mutual_settlement, class_name: 'Spree::MutualSettlement'
  end
end
