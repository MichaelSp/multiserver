require "os/*"

module OS
  def self.current
    @@current_os ||= case distribution
    when "Debian" then OS::Debian.new
    when "Ubuntu" then OS::Ubuntu.new
    else
      OS::Basic.new
    end
  end

  def self.distribution
    @@distribution ||= if File.exists?("/etc/lsb-release")
        File.read("/etc/lsb-release").gsub /DISTRIB_ID=(\w+).*/m {|_, match| match[1]}
      else
        "Unkown"
    end
  end

end
