module Spree
  class Price < Spree::Base
    include VatPriceCalculation

    acts_as_paranoid

    MAXIMUM_AMOUNT = BigDecimal('99_999_999.99')

    belongs_to :variant, class_name: 'Spree::Variant'
    belongs_to :role, class_name: 'Spree::Role'
    belongs_to :product, class_name: "Spree::Product"

    before_validation :ensure_currency

    validates :amount, allow_nil: true, numericality: {
      greater_than_or_equal_to: 0,
      less_than_or_equal_to: MAXIMUM_AMOUNT
    }
    before_save :set_amount
    #before_update :update_amount

    extend DisplayMoney
    money_methods :amount, :price

    self.whitelisted_ransackable_attributes = ['amount']

    def money
      Spree::Money.new(amount || 0, currency: currency)
    end

    def amount=(amount)
      self[:amount] = Spree::LocalizedNumber.parse(amount)
    end

    alias_attribute :price, :amount

    def price_including_vat_for(price_options)
      options = price_options.merge(tax_category: variant.tax_category)
      gross_amount(price, options)
    end

    def display_price_including_vat_for(price_options)
      Spree::Money.new(price_including_vat_for(price_options), currency: currency)
    end

    # Remove variant default_scope `deleted_at: nil`
    def variant
      Spree::Variant.unscoped { super }
    end

    private

    def set_amount
      #rate = Spree::Config[:rate]
      rate = 26.8
      ::Money.add_rate("USD", "UAH", rate)
      amount =  ::Money.us_dollar(self.amount_usd).exchange_to("UAH").amount*100
      self.amount = amount
    end

    def update_amount
      if self.amount_usd_changed?
        rate = Spree::Config[:rate]
        ::Money.add_rate("USD", "UAH", rate)
        amount =  ::Money.us_dollar(self.amount_usd).exchange_to("UAH")
        self.amount = amount
      end
    end


    def ensure_currency
      self.currency ||= Spree::Config[:currency]
    end
  end
end
