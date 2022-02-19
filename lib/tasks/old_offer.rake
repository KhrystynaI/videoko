namespace :old_offer do
  desc "It deletes old offer"
  task delete: :environment do
    uncomplete_offer = Spree::Offer.select{|offer| offer.status == "uncomplete"}
    uncomplete_offer.each do |offer|
      if offer.created_at + 30.day > Time.now
        offer.offer_items.each{|c| c.delete}
        offer.delete
      end
    end
  end

end
