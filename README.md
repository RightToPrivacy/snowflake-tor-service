# snowflake-torproxy-service

Automated Tor Snowflake Source Download, Building, and service install for Tor Snowflake Proxy (starts every boot under default 'snowflake' user)

Single command install on any Linux device (phones, singleboard computer, laptop, servers etc)

RUN install.sh FROM TERMINAL INSIDE snowflake-tor-service DIR

---

## PURPOSE

Yet another option for running Tor Snowflake Proxy (dedicated standalone service).

The install.sh script is a fully automated installer, now offering 'upgrade' as an option.

Turn any (systemd based) Linux distribution device into a dedicated Tor Snowflake Proxy to help 
internet censored users connect to Tor.

(there are other options like the Tor Snowflake docker - this is just yet another option for users)

---

## REQUIREMENTS 

* Golang (install this first or you won't be able to build the source)

* systemd based Linux distro (for boot / service)

---

## GET STARTED HERE

**FIRST Make Sure Golang Is Installed On Your System (To Build)**

**Get Golang On Debian Based Distro:**

    apt install golang
    
**Get Golang On Arch Based Distro (EndeavourOS, Manjaro, Artix, Arch):**

    pacman -S golang
    
**NEXT: Download This (snowflake-tor-service)**

**LOCATION 1:** Download From Gitea Onion - http://gg6zxtreajiijztyy5g6bt5o6l3qu32nrg7eulyemlhxwwl6enk6ghad.onion/RightToPrivacy/snowflake-tor-service

Or:

    git clone: https://github.com/RightToPrivacy/snowflake-tor-service.git

**NEXT RUN:**

    cd snowflake-tor-service

    sudo bash install.sh

That's it. In a couple minutes (or less) you should have a running Tor Snowflake Proxy service.

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

**FIRST:** move into snowflake-tor-service dir with install.sh (from terminal)

**NEXT RUN:**

    sudo bash install.sh upgrade

---

**LOGFILE (BY DEFAULT) IN:** /home/snowflake/snow.log

---

Video Demo: https://www.youtube.com/watch?v=UUVY-SzlxAM

Blog Post: https://bmc.link/politictech/fully-automated-tor-snowflake-proxy-server-installer-any-linux-device

---

**CONTACT**

righttoprivacy[at]i2pmail.org
righttoprivacy[at]tutanota.com

---

### RELATED LINKS

**Donate Tor Project:** https://donate.torproject.org

**Tor Project Standalone Snowflake:** http://xmrhfasfg5suueegrnc4gsgyi2tyclcy5oz7f5drnrodmdtob6t2ioyd.onion/relay/setup/snowflake/standalone/index.html

**Tor Snowflake Survival Guide:** https://gitlab.torproject.org/tpo/anti-censorship/team/-/wikis/Survival-Guides/Snowflake-Bridge-Survival-Guide#standalone-proxy-go-instances
