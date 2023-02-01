# snowflake-torproxy-service

Automated Tor Snowflake Source Download, Building, and service install for Tor Snowflake Proxy (starts every boot under default 'snowflake' user)

Single command install on any Linux device (phones, singleboard computer, laptop, servers etc)

---

## PURPOSE

Yet another option for running Tor Snowflake Proxy (dedicated standalone service).

The install.sh script is a fully automated installer, now offering 'upgrade' as an option.

Turn any (systemd based) Linux distribution device into a dedicated Tor Snowflake Proxy to help 
internet censored users connect to Tor.

---

## REQUIREMENTS 

* Golang (install this first or you won't be able to build the source)

* systemd based Linux distro (for boot / service)

---

## GET STARTED

**FIRST:** Download this snowflake-tor-service to the machine you wish to create Snowflake Tor proxy service on

**NEXT RUN:**

    cd snowflake-tor-service

    sudo bash install.sh

That's it. In 3 minutes (or less) you should have a running Tor Snowflake Proxy service.

#### IMPORTANT: Make Sure You Are Inside Download Directory Before Running: sudo bash install.sh

---

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

### UPGRADE (initial revision)

    sudo bash install.sh upgrade

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
