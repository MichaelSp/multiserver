class OS::Basic

  def init_system_name
    File.read_lines("/proc/1/stat").first.gsub /.*\((\w+)\).*/m {|_,match| match[1]}
  end

end
