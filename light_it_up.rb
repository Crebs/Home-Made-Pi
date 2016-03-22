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
      self.pin.on
      sleep sleep_time
      self.pin.off
      sleep sleep_time
      self.pin2.on
      sleep sleep_time
      self.pin2.off
      sleep sleep_time
      self.pin3.on
      sleep sleep_time
      self.pin3.off
      sleep sleep_time
      self.pin4.on
      sleep sleep_time
      self.pin4.off
      sleep sleep_time
      i+=1
    end
  end
end



