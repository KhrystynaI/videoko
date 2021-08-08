set :output, "videoko/current/log/cron.log"
every 1.day, at: '4:30 am' do
  rake "old_offer:delete"
end
