require 'pi_piper'
include PiPiper

while 1 do
  pin = PiPiper::Pin.new(:pin => 11, :direction => :out)
  pin.on
  sleep 3
  pin.off
end