
local socket = require("socket")
host = host or "localhost"
port = port or 8080

if arg then
	host = arg[1] or host
	port = arg[2] or port
end

print("Binding to host '" ..host.. "' and port " ..port.. "...")
s = assert(socket.bind(host, port))
i, p   = s:getsockname()
assert(i, p)
print("Waiting connection from client on " .. i .. ":" .. p .. "...")
c = assert(s:accept())
print("Connected Succesfully! Here is the message sent by client:")
l, err = c:receive()

while not err do
	reversedString = l.reverse(l)
	print(l)
	c:send(reversedString .. "\n")
	l, err = c:receive()
end

print(err)
