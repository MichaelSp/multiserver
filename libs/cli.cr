require "multiserver"
require "colorize"

class Cli
  def initialize @args
    parse
  end

  def parse
    @command = @args[0]?
    @command = "usage" unless ["start", "stop", "status", "init", "reload", "restart", "list"].includes?(@command)
  end

  def run
    case @command
    when "start" then start @args[1]?
    when "stop" then stop @args[1]?
    when "status" then status @args[1]?
    when "reload" then reload @args[1]?
    when "restart" then restart @args[1]?
    when "init" then init
    when "list" then list @args[1]? == "enabled"
    else
      show_usage
    end
  end

  def init
    MultiServer::Servers.enabled.each do |server|
      print "#{server.name.colorize.bold} write startup script to #{server.startup_script_file} - "
      begin
        server.write_startup_script
        print "Ok\n".colorize(:green)
      rescue ex : Exception
        puts "\t#{ex.message}".colorize(:red)
      end
    end
  end

  def list enabled=false
    servers = MultiServer::Servers.enabled
    if servers.empty?
      print "No Servers #{enabled ? "enabled" : "available"}"
    else
      puts servers.map{|s| s.name.colorize(s.running? ? :green : :red)}.join "\n"
    end
  end

  def start server_name
  end

  def stop server_name
  end

  def status server_name
    return list if server_name.nil?
  end

  def reload server_name
  end

  def restart server_name
  end

  def show_usage
    puts "#{PROGRAM_NAME} command [server_name]"
    puts "   command: (start|stop|status|reload|restart|init)"
    puts "       start|stop|status|reload   - Guess what?!"
    puts "       init                       - Writes startup files for all enabled services"
    puts "       list [enabled]             - List all (enabled) servers."
  end

end
