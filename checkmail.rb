# requires https://github.com/dcparker/ruby-gmail (sudo gem install ruby-gmail)
# https://github.com/javan/whenevern (sudo gem install whenever)

require 'gmail'
require './light_it_up'

email_count = 0

piLED = PiLEDRunner.new()
while 1
  Gmail.new('rileycrebs', 'B.68GH51+%g5127') do |gmail|
    current_email_count = gmail.mailbox('Inbox').count
    puts "number of unread email #{current_email_count}"
    if email_count != current_email_count
      puts 'light up leds.'
      piLED.light_up_the_pi()
      email_count = current_email_count
    end
  end
  sleep 5
end