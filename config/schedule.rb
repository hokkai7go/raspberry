set :output, {:error => '/home/pi/log/error.log', :standard => '/home/pi/log/standard.log' }

every 1.hours do
  command "cd /home/pi/src/raspberry && /usr/bin/bundle exec /usr/bin/ruby raspberry_ip_checker.rb | xargs /usr/bin/bundle exec /usr/bin/ruby pircbot.rb"
end
