class Spree::ImageSlider < ApplicationRecord
  has_one_attached :picture

  validates :number, numericality: { only_integer: true }
  validates :picture, presence: true, blob: { content_type: ['image/png', 'image/jpg', 'image/jpeg'], size_range: 0.1..(0.8.megabytes)  }
end
