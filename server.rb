#!/usr/bin/env jruby
#!/usr/bin/env macruby

require 'rubygems'
require 'socket'

server = TCPServer.new 2000

@count = 0;

# some work
def fib(n)
  return n if (0..1).include? n
  fib(n-1) + fib(n-2) if n > 1
end

loop do
  @count += 1;
  puts "New thread #{@count}"
  Thread.new(server.accept) do |client|
    client.puts fib 10
    client.close
    puts "CLose thread"
  end
end

