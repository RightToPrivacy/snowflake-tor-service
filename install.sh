#!/bin/bash
#
# automatically download, build, create  and start new Tor Snowflake Proxy Service
# under 'snowflake user' (created by this installer)
#
# feel free to reupload and share to help grow the snowflake network by making it automated
#
# righttoprivacy[at]tutanota.com
# 
# Gitea Onion: http://gg6zxtreajiijztyy5g6bt5o6l3qu32nrg7eulyemlhxwwl6enk6ghad.onion/RightToPrivacy/snowflake-tor-service
#

# Text Colors
export BLUE='\033[1;94m'
export GREEN='\033[1;92m'
export RED='\033[1;91m'
export ENDCOLOR='\033[1;00m'


if [ "$EUID" -ne 0 ]
  then echo -e "${RED}Must Run As root. Exiting.${ENDCOLOR}\n"
  exit
fi

# CHECK FOR GOLANG;
if ! command -v go &> /dev/null
then
	echo -e "${RED}go not found. Tor Snowflake proxy requires it to build source. Install golang pkg and rerun install.sh..${ENDCOLOR}" && sleep .75
	exit
else
    echo -e "${GREEN}golang is installed. Continuing.${ENDCOLOR}" && sleep .5
fi

echo -e "${GREEN}Automated Tor${ENDCOLOR} ${BLUE}Snowflake${ENDCOLOR} ${GREEN}Proxy Installer${ENDCOLOR}\n"
sleep .75

cat << "EOF"


                ()
                /\
               //\\
              <<  >>
          ()   \\//   ()
()._____   /\   \\   /\   _____.()
   \.--.\ //\\ //\\ //\\ /.--./
    \\__\\/__\//__\//__\\/__//
     '--/\\--//\--//\--/\\--'
        \\\\///\\//\\\////
    ()-= >>\\< <\\> >\\<< =-()
        ////\\\//\\///\\\\
     .--\\/--\//--\//--\//--.
    //""/\\""//\""//\""//\""\\
   /'--'/ \\// \\// \\// \'--'\
 ()`"""`   \/   //   \/   `""""`()
          ()   //\\   ()
              <<  >>
               \\//
                \/
                ()

EOF

sleep .5

# MOVE START SNOWFLAKE SCRIPT MAKE EXEC
cp start-snowflake /usr/bin/start-snowflake
chmod +x /usr/bin/start-snowflake
cp snowflake.service /etc/systemd/system


# DOWNLOAD AND BUILD SNOWFLAKE SOURCE
function buildsnow() {
	cd /home/snowflake && sudo -u snowflake git clone https://git.torproject.org/pluggable-transports/snowflake.git
	cd snowflake/proxy
	echo -e "${GREEN}BUILDING TOR SNOWFLAKE PROXY SOURCE...${ENDCOLOR}\n"
	sudo -u snowflake go build /home/snowflake/snowflake/proxy/
}

# CREATE SYSTEMD SERVICE UNDER SNOWFLAKE USER; START; ENABLE FOR BOOT;
function makeservice() {
	systemctl daemon-reload
	systemctl enable snowflake.service
	systemctl start snowflake.service || echo -e "{RED}FAILED TO START SNOWFLAKE SERVICE${ENDCOLOR}\n"	
}

# CREATE SNOWFLAKE USER FOR OUR SERVICE
echo -e "${GREEN}ADDING 'snowflake' USER TO RUN SNOWFLAKE SERVICE...${ENDCOLOR}\n" && sleep .5
useradd -m --shell /usr/bin/nologin snowflake || echo -e "${RED}FAILED TO ADD USER SNOWFLAKE${ENDCOLOR}\n" 

# BUILD TOR SNOWFLAKE SOURCE
buildsnow || echo -e "${RED}FAILED TO BUILD SNOWFLAKE PROXY SOURCE. DO YOU HAVE GOLANG?${ENDCOLOR}\n"  

makeservice && echo -e "${GREEN}INSTALL COMPLETED.${ENDCOLOR}\n" || echo -e "${RED}SNOWFLAKE SERVICE INSTALL FAILED${ENDCOLOR}\n"

sleep .5 && echo -e "${GREEN}DONE. CHECK SNOWFLAKE STATUS WITH:${ENDCOLOR} ${BLUE}systemctl status snowflake.${ENDCOLOR}\n"
sleep .5

