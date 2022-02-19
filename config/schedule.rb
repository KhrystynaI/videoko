set :output, "videoko/current/log/cron.log"
every 1.day, at: '4:30 am' do
  rake "old_offer:delete"
end

every 28.days, :at => '4:30 am' do
  rake "log:clear"
end
