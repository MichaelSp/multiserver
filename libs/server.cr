class MultiServer::Server
  property config_file, status

  def initialize @config_file
    @os = OS.current
    @status = "halt"
  end

  def startup_script_file
    @os.startup_script_for name
  end

  def write_startup_script
    @os.write_startup_script_for name
  end

  def name
    @name ||= @config_file.split('/').last
  end

  def running?
    @status == "running"
  end
end
