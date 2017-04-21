require 'socket'                # Get sockets from stdlib
require './pi_temp'

piTemp = PiTempReader.new()
server = TCPServer.open(2000)   # Socket to listen on port 2000
loop {                          # Servers run forever
  Thread.start(server.accept) do |client|
    client.puts 'Enter Temp (F°): '
    temp = client.gets
    piTemp.automate_tempurature(temp)
    client.puts 'Tempurature set to ' + temp + 'F°'
    client.puts "Closing the connection. Bye!"
    client.close                # Disconnect from the client
  end
}
