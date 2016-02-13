require 'pi_piper'
include PiPiper

pin = PiPiper::Pin.new(:pin => 11, :direction => :out)
while 1 do
  pin.on
  sleep 3
  pin.off
end