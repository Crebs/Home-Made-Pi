require 'socket'      # Sockets are in standard library

hostname = '10.0.1.71'
port = 2000

s = TCPSocket.open(hostname, port)
puts s.gets.chop      # And print with platform line terminator
temp = gets.chop
s.puts temp
puts s.gets.chop
puts s.gets.chomp
s.close               # Close the socket when done
