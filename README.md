# snowflake-torproxy-systemd

Service file and start script for Tor Snowflake Proxy (starts every boot under default 'snowflake' user)

To make it easy to run a dedicated snowflake on any Linux device (phones, singleboard computer, laptop, servers etc)

---

## REQUIREMENTS

* Golang (install this first or you won't be able to build the source)

## GET STARTED

You only need to download the install.sh on machine you wish to turn into a snowflake server

(the rest of downloading and building is automated for you)

**FIRST:** Install tor client and started. Make sure to have git, torify installed before running install.sh..

**NEXT RUN:**

    chmod +x install.sh
    sudo ./install.sh

That's it.

*Enjoy helping users around the world connect to Tor*

---

## COMMANDS (POST INSTALL)

**START SNOWFLAKE (install.sh automatically starts for you):**

    sudo systemctl start snowflake.service

**STOP SNOWFLAKE:**

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

At the time of writing this, it is found on the following Gitea Onion (other locations in future):

http://gg6zxtreajiijztyy5g6bt5o6l3qu32nrg7eulyemlhxwwl6enk6ghad.onion/RightToPrivacy/snowflake-tor-service

**Notice Problem With This?** File an issue at above location (use Tor browser)

**BLOG:** https://buymeacoffee.com/politictech/posts (public)

---

### RELATED LINKS

**Donate Tor Project:** https://donate.torproject.org

**Tor Project Standalone Snowflake:** http://xmrhfasfg5suueegrnc4gsgyi2tyclcy5oz7f5drnrodmdtob6t2ioyd.onion/relay/setup/snowflake/standalone/index.html

**Tor Snowflake Survival Guide:** https://gitlab.torproject.org/tpo/anti-censorship/team/-/wikis/Survival-Guides/Snowflake-Bridge-Survival-Guide#standalone-proxy-go-instances
