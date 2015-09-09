class MultiServer::Server
  property config_file

  def initialize @config_file
    @os = OS.current
  end

  def startup_script_file
    @os.startup_script_for name
  end

  def write_startup_script
    true
  end

  def name
    @name ||= @config_file.split('/').last
  end

end
