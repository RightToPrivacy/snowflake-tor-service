# snowflake-torproxy-service

Automated Tor Snowflake Source Download, Building, and service install for Tor Snowflake Proxy (starts every boot under default 'snowflake' user)

Single command makes it as easy as possible to start running a dedicated snowflake: on any Linux device (phones, singleboard computer, laptop, servers etc)

---

#### VIDEO DEMO (in 1 minute everything is finished):
https://youtu.be/UUVY-SzlxAM

## REQUIREMENTS 

* Golang (install this first or you won't be able to build the source)

* systemd based Linux distro (for boot / service)
---

## GET STARTED

**FIRST:** Download this snowflake-tor-service to the machine you wish to create Snowflake Tor proxy service on

**NEXT RUN:**

    sudo bash install.sh

That's it. In 3 minutes (or less) you should have a running Tor Snowflake Proxy service.

*Enjoy helping users around the world connect to Tor*

---

Try it on your Linux laptop, server, tablet, phone... Phones likely make ideal candidate with dynamic IP, changing locations.

---

## COMMANDS (POST INSTALL)

**STARTING SNOWFLAKE (install.sh automatically starts for you):**

    sudo systemctl start snowflake.service

**STOPPING SNOWFLAKE:**

    sudo systemctl stop snowflake.service

**RESTART SNOWFLAKE PROXY:**

    sudo systemctl restart snowflake.service

**DISABLE SNOWFLAKE PROXY SERVICE (prevents starting at boot):**

    sudo systemctl disable snowflake.service 

**CHECK YOUR SNOWFLAKE PROXY STATUS:**

    sudo systemctl status snowflake.service

*(every hour you should see connections, data relayed in status)*

---

**LOGFILE (BY DEFAULT) IN:** /home/snowflake/snow.log

---

### GIT REPOSITORY LOCATION (TOR ANON GIT SERVICE) 

At the time of writing this, found on the following Gitea Onion / Gitlab / Github:

Main Location (checked more frequently): http://gg6zxtreajiijztyy5g6bt5o6l3qu32nrg7eulyemlhxwwl6enk6ghad.onion/RightToPrivacy/snowflake-tor-service

https://github.com/RightToPrivacy/snowflake-tor-service (uploaded here but not main)

https://gitlab.com/Aresesi/snowflake-tor-service/ (uploaded here but not main)

---

**Notice Problem With This?** File an issue at above location (use Tor browser)

Or email righttoprivacy[at]tutanota.com

**BLOG POST:** https://www.buymeacoffee.com/politictech/fully-automated-tor-snowflake-proxy-server-installer-any-linux-device (public)

---

### RELATED LINKS

**Donate Tor Project:** https://donate.torproject.org

**Tor Project Standalone Snowflake:** http://xmrhfasfg5suueegrnc4gsgyi2tyclcy5oz7f5drnrodmdtob6t2ioyd.onion/relay/setup/snowflake/standalone/index.html

**Tor Snowflake Survival Guide:** https://gitlab.torproject.org/tpo/anti-censorship/team/-/wikis/Survival-Guides/Snowflake-Bridge-Survival-Guide#standalone-proxy-go-instances
