#!/usr/bin/env jruby
#!/usr/bin/env macruby

require 'rubygems'
require 'socket'

@count = 0;

server = 'localhost'
port = 2000

loop do
  @count += 1;
  puts "New thread #{@count}"
  Thread.new(TCPSocket.new(server, port)) do |server|
    puts server.gets
  end
end


