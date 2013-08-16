set :output, '/home/pi/log'

every 1.hours do
  command "/usr/bin/bundle exec /usr/bin/ruby raspberry_ip_checker.rb | xargs /usr/bin/bundle exec /usr/bin/ruby pircbot.rb"
end
