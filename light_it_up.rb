require 'pi_piper'
include PiPiper
pin_number = 11

pin = PiPiper::Pin.new(:pin => pin_number, :direction => :out)
while 1 do
  pin.on
  sleep 3
  pin.off
end