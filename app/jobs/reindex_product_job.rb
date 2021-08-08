class ReindexProductJob < ApplicationJob
  queue_as :default

  def perform(*args)
    command = "RAILS_ENV=#{ENV["RAILS_ENV"]} bundle exec rake searchkick:reindex CLASS=Spree::Product"
    system(command)
  end

end
