require "./spec_helper"

describe OS do
  it "returns current OS" do
    OS.current.class.should eq OS::Ubuntu
  end

  it "can detect current distribution" do
    OS.distribution.should eq "Ubuntu"
  end

  it "can tell about the init system" do
    OS.current.init_system_name.should eq "systemd"
  end
end
