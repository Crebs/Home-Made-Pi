require 'pi_piper'
include PiPiper
<<<<<<< HEAD
pin_number = 11

pin = PiPiper::Pin.new(:pin => pin_number, :direction => :out)
=======
sleep_time = 0.0250
pin = PiPiper::Pin.new(:pin => 22, :direction => :out)
pin2 = PiPiper::Pin.new(:pin => 27, :direction => :out)
pin3 = PiPiper::Pin.new(:pin => 17, :direction => :out)
pin4 = PiPiper::Pin.new(:pin => 24, :direction => :out)
>>>>>>> a1e3101462d791109a0ea15fb56543c8bede8bf0
while 1 do
  pin.on
  sleep sleep_time
  pin.off
  sleep sleep_time
  pin2.on
  sleep sleep_time
  pin2.off
  sleep sleep_time
  pin3.on
  sleep sleep_time
  pin3.off
  sleep sleep_time
  pin4.on
  sleep sleep_time
  pin4.off
  sleep sleep_time
end
