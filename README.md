# snowflake-torproxy-service

Automated Tor Snowflake Source Download, Building, and service install for Tor Snowflake Proxy (starts every boot under default 'snowflake' user)

Single command install on any Linux device (phones, singleboard computer, laptop, servers etc)

---

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

Video Demo: https://youtu.be/UUVY-SzlxA

Blog Post: https://www.buymeacoffee.com/politictech/fully-automated-tor-snowflake-proxy-server-installer-any-linux-device

---

### RELATED LINKS

**Donate Tor Project:** https://donate.torproject.org

**Tor Project Standalone Snowflake:** http://xmrhfasfg5suueegrnc4gsgyi2tyclcy5oz7f5drnrodmdtob6t2ioyd.onion/relay/setup/snowflake/standalone/index.html

**Tor Snowflake Survival Guide:** https://gitlab.torproject.org/tpo/anti-censorship/team/-/wikis/Survival-Guides/Snowflake-Bridge-Survival-Guide#standalone-proxy-go-instances
