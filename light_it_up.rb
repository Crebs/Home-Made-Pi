require 'pi_piper'
include PiPiper


pins.each do |led|
  File.open("/sys/class/gpio/unexport", "w") { |f| f.write("#{pin}") }
end

while 1 do
  pin = PiPiper::Pin.new(:pin => 11, :direction => :out)
  pin.on
  sleep 3
  pin.off
end