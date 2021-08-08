module Spree
  module UserDecorator
    def self.prepended(base)
      base.validates_uniqueness_of :sku, allow_blank: true
      base.has_many :offers, class_name: 'Spree::Offer',dependent: :destroy
      base.has_many :mutual_settlements, class_name: 'Spree::MutualSettlement',dependent: :destroy
      base.has_many :repairs, class_name: 'Spree::Repair',dependent: :destroy
    end

    def full_name
      if self.first_name.blank? && self.last_name.blank?
        result = self.login
      elsif self.first_name.blank? && !self.last_name.blank?
        result = self.last_name
      elsif !self.first_name.blank? && self.last_name.blank?
        result =self.first_name
      elsif !self.first_name.blank? && !self.last_name.blank?
       result = "#{self.first_name}" +" "+ "#{self.last_name}"
     end
    end

    def full_name_header
      if self.first_name.blank? && self.last_name.blank?
        result = self.login.split("@")[0].truncate(11, omission: ".")
      elsif self.first_name.blank? && !self.last_name.blank?
        result = self.last_name.truncate(11, omission: ".")
      elsif !self.first_name.blank? && self.last_name.blank?
        result =self.first_name.truncate(11, omission: ".")
      elsif !self.first_name.blank? && !self.last_name.blank?
       result = self.first_name.truncate(11, omission: ".")
     end
    end

    Spree::User.prepend self
  end
end
