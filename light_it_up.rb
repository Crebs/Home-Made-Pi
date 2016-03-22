require 'pi_piper'
include PiPiper

class PiLEDRunner
  
  def initialize
    @pin = PiPiper::Pin.new(:pin => 22, :direction => :out)
    @pin2 = PiPiper::Pin.new(:pin => 27, :direction => :out)
    @pin3 = PiPiper::Pin.new(:pin => 17, :direction => :out)
    @pin4 = PiPiper::Pin.new(:pin => 24, :direction => :out)
    @sleep_time = 0.0250
  end
  
  
  def light_up_the_pi()
    i = 0
    while i < 60 do
      self.light_up_pin(@pin)
      self.light_up_pin(@pin2)
      self.light_up_pin(@pin3)
      self.light_up_pin(@pin4)
      sleep @sleep_time
      i+=1
    end
  end
  
  def light_up_pin(pin)
    pin.on
    sleep @sleep_time
    pin.off
  end
end



