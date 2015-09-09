class MultiServer::Servers

  CONFIG_DIR = "/etc/servers"

  def self.enabled
    servers = Dir["#{CONFIG_DIR}/*"] - [".", ".."]
    servers.map do |server_config|
      Server.new server_config
    end
  end
end
