require 'pi_piper'
include PiPiper

class PiLEDRunner
  
  def initialize
    @pin = PiPiper::Pin.new(:pin => 18, :direction => :out)
    @pin2 = PiPiper::Pin.new(:pin => 23, :direction => :out)
    @sleep_time = 0.0250
  end
  
  
  def light_up_the_pi()
    i = 0
    while i < 60 do
      self.light_up_pin(@pin)
      self.light_up_pin(@pin2)
      sleep @sleep_time
      i+=1
    end
  end
  
  def light_up_pin(pin)
    pin.on
  end

  def turn_off_led(pin)
    pin.off
  end

  def turn_on_red_led()
    self.light_up_pin(@pin)
    self.turn_off_led(@pin2)
  end

  def turn_on_green_led()
    self.light_up_pin(@pin2)
    self.turn_off_led(@pin)
  end
end
