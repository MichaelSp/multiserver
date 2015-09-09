# This will read all files in /etc/servers/, create the necessary
# startup scripts for your startup system and sarts the services
#

require "servers"

MultiServer::Servers.enabled.each do |server|
  server.write_startup_script
  MultiServer::Monitor.add server
end
