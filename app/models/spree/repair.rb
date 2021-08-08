module Spree
  class Repair < Spree::Base
    belongs_to :user, class_name: 'Spree::User'
    enum status: [:in_progress, :waiting_for_parts, :sent_to_manufacturer, :repaired, :without_repair ]

    validates :user_id, presence: true
    validates :status, presence: true
    validates :number, presence: true
    validates :phone, length: { is: 13 }
  end
end
