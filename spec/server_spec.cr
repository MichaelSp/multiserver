require "./spec_helper"

describe MultiServer::Server do

  it "can write it's own startup file" do
    server = MultiServer::Server.new "./fixtures/sample"
    server.config_file.should eq "./fixtures/sample"
    server.write_startup_script.should be_true
    server.startup_script_file.should eq "/etc/init/"
    server.name.should eq "sample"
    File.read_lines(server.startup_script_file).should eq ""
  end
end
