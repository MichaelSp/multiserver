# This will read all files in /etc/servers/, create the necessary
# startup scripts for your startup system and sarts the services
#

require "cli"

cli = Cli.new ARGV
cli.run
