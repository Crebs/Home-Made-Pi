require './light_it_up'

class PiTempReader
   def initialize
      system("modprobe w1-gpio")
      system("modprobe w1-therm")
      @piLED = PiLEDRunner.new()
      @set_temp = 0
      sence_temp_change()
      @last_temp = 0
   end
   def read_temp_raw()
      base_dir = File.expand_path('/sys/bus/w1/devices/')
      files = Dir[File.join(base_dir, '28*')]
      #p files.map {|f| f.sub!(base_dir,"")}
      device_folder = files[0]
      device_file = device_folder + '/w1_slave'
      contents = File.readlines(device_file)
      index = contents[-1].index('t=')
      temp_string = contents[-1][index+2...-1]
      temp_c = temp_string.to_f / 1000.0 
      temp_f = temp_c * 9.0/5.0 + 32.0
      print("Current temp is: " + temp_c.to_s + "°C ", temp_f.to_s + "°F Currently set to : " +  @set_temp.to_s + "°F\n")
      return temp_c, temp_f
   end
   def sence_temp_change()
      listen = Thread.new {
	while 1
            automate_tempurature(@set_temp)
            sleep 5*60
        end
      }.run
   end 

   def automate_tempurature(input)
      @set_temp = input
      temp = read_temp_raw()[1]
      if temp < @last_temp
	 @piLED.turn_on_red_led()
         sleep 15*60
         @last_temp = 0
      end
      if temp > input.to_f
         @piLED.turn_on_red_led()
         @last_temp = 0
      else
         @piLED.turn_on_green_led()
         @last_temp = temp
      end
   end

end

piTemp = PiTempReader.new()
while 1
   puts "Enter Temp (F°): "
   temp = gets.chomp 
   piTemp.automate_tempurature(temp)
end