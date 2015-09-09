module OS::StartupSystem
  def startup_script_for server_name
    case init_system_name
    when "systemd" then
      "/etc/systemd/system/#{server_name.underscore}"
    else
      "/etc/init.d/#{server_name.underscore}"
    end
  end

  def write_startup_script_for name
    context = {
      description: "No Description"
      server_name: name
    }
    template = File.read "#{__DIR__}/startup_system/#{init_system_name}.template"
    File.write startup_script_for(name), template.gsub(/#\{(w+)\}/, context)
  end

  def init_system_name
    File.read_lines("/proc/1/stat").first.gsub /.*\((\w+)\).*/m {|_,match| match[1]}
  end
end
