module Spree
  class Post < Spree::Base
    has_one_attached :video, dependent: :destroy
    validates :title, presence: true, uniqueness: { case_sensitive: false }
    translates :title
    translates :body
    paginates_per 5
end
end
