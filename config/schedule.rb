# Use this file to easily define all of your cron jobs.

# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron
set :environment, :development
env :PATH, ENV['PATH']
# Example:

# set :output, "/path/to/my/cron_log.log"
set :output, 'log/crontab.log'

every 1.day, :at => '9:00 am' do
  # command "/usr/bin/some_great_command"
  runner "DailyMailer.send_daily_mail_users"
  # rake "some:great:rake:task"
end

# every 1.day, :at => '9:00 am' do
#   runner "DailyMailer.send_daily_mail.deliver"
# end

# Learn more: http://github.com/javan/whenever
