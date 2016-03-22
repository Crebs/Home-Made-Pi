# requires https://github.com/dcparker/ruby-gmail (sudo gem install ruby-gmail)
# https://github.com/javan/whenevern (sudo gem install whenever)

require 'gmail'

email_count = 0


Gmail.new('rileycrebs', 'B.68GH51+%g5127') do |gmail|
  while 1
    current_email_count = gmail.mailbox('Inbox').count(:unread)
    puts "number of unread email #{current_email_count}"
    if email_count != current_email_count
      puts 'light up leds.'
      email_count = current_email_count
    end
    sleep 5
  end
end