# MultiServer
This is an project to create all kinds of servers (Email, Web, DNS, ...) to replace the old and famous projects (Apache, Bind, Postfix, ...).
Why? Did you ever try to run your own web server or mail server? After hours or even days of googling around you still don't get it to work?
Stackoverflow tells you to throw another bunch of config options into obscure files and that makes it even worse.

MultiServer is better because:
 - is easier to deploy, maintain, extent
 - it shares code for all servers
 - has a common configuration language (YAML)
 - it follows convention over configuration

Ok, that's nice. But there has to be a downside.

Yes, you are right. It probably has less features.

# Use Cases
- It has to be so easy that even my mother can run her own Mail-Server with a bunch of clicks.
- Install, run, customize web-applications based on
  - PHP (Wordpress, Magento, OwnCloud)
  - Ruby (Rails, Spree)
  - Python (Django, Flask)
  - Go
  - Crystal ?

# Getting started
TODO: What should my mother do?

# Configuration
All configurations are located at `/etc/servers/`


# What's not (yet) on the list
- Mysql/PostgreSQL
- Redis
- Syslog
- Gitlab
- SSH
- Samba

# Task List
- [ ] The startup process. Every server should register as an systemd/init/... server.
- [ ] monitoring service to capture performance metrics and restarts servers
- [ ] central, location for all configurations. Suggested format: YAML
- [ ] make a fancy logo & web-page to introduce this idea
- [ ] should there be a web-interface to configure everything?
- [ ] what about an API?
- [ ] (optionally) run the servers inside docker containers?
- [ ] required/basic set of servers
  - [ ] DNS
  - [ ] Email (SMTP & IMAP)
   - [ ] Anti Spam
- [ ] Other optional servers
  - [ ] VPN
  - [ ] Email mailing list manager
  - [ ] (Reverse-) Proxy
