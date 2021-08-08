module Spree
  class Volume < Spree::Base

  belongs_to :product, class_name: "Spree::Product"
  has_many_attached :images
  
  end
end
