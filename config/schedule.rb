set :output, "videoko/current/log/cron.log"
every 1.day, at: '4:30 am' do
  rake "old_offer:delete"
end

every 2.days, :at => '4:30 am' do
  rake "log:clear"
end

every 2.days, :at => '5:30 am' do
  rake "tmp:cache:clear"
end
