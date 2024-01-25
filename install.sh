#!/bin/bash
#
# automatically download, build, create  and start new Tor Snowflake Proxy Service
# under 'snowflake user' (created by this installer)
#
# feel free to reupload and share to help grow the snowflake network by making it automated
#
# righttoprivacy[at]i2pmail.org / righttoprivacy[at]tutanota.com
# 
# Gitea Onion: http://gg6zxtreajiijztyy5g6bt5o6l3qu32nrg7eulyemlhxwwl6enk6ghad.onion/RightToPrivacy/snowflake-tor-service
#

# TEXT COLORS
export BLUE='\033[1;94m'
export GREEN='\033[1;92m'
export RED='\033[1;91m'
export ENDCOLOR='\033[1;00m'

golangreq="golang-v1.21"

# CHECK IF ABLE TO INSTALL SERVICE
if [ "$EUID" -ne 0 ]
  then echo -e "${RED}Must Run As root. Exiting.${ENDCOLOR}\n"
  exit
fi

# CHECK FOR GOLANG;
if ! command -v go &> /dev/null
then
	echo -e "${RED}go not found. Tor Snowflake proxy requires ${golangreq} to build source. Install golang pkg and rerun install.sh..${ENDCOLOR}" && sleep .75
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
function mvFiles() {
	cp start-snowflake /usr/bin/start-snowflake
	chmod 755 /usr/bin/start-snowflake
	cp snowflake.service /etc/systemd/system
}

# DOWNLOAD AND BUILD SNOWFLAKE SOURCE
function buildsnow() {
	cd /home/snowflake && sudo -u snowflake git clone https://git.torproject.org/pluggable-transports/snowflake.git
	cd snowflake/proxy
	echo -e "${GREEN}BUILDING TOR SNOWFLAKE PROXY SOURCE...${ENDCOLOR}\n"
	sudo -u snowflake go build /home/snowflake/snowflake/proxy/ || {
		echo -e "${RED}FAILED TO BUILD. DO YOU HAVE ${golangreq}?"${ENDCOLOR}
	}	
}

# CREATE SYSTEMD SERVICE UNDER SNOWFLAKE USER; RESTART; ENABLE FOR BOOT;
function makeservice() {
	systemctl daemon-reload
	systemctl enable snowflake.service
	systemctl restart snowflake.service || echo -e "${RED}FAILED TO START SNOWFLAKE SERVICE${ENDCOLOR}\n"	
}

# UPGRADE TO LATEST SNOWFLAKE 
# run: 'sudo bash install.sh upgrade' to upgrade your snowflake service to latest
if [ "$1" == 'upgrade' ]; then
	echo -e "${BLUE}Shutting Down Snowflake Server...${ENDCOLOR}\n" && sleep .5
	systemctl stop snowflake
	cd /home/snowflake								
	# DOWNLOAD CHANGES
	echo -e "${BLUE}Downloading Latest...${ENDCOLOR}\n"
	cd /home/snowflake/snowflake
	sudo -u snowflake git pull
	# BUILD NEW SNOWFLAKE UPGRADE
	cd proxy
	sudo -u snowflake go build -buildvcs=false && makeservice && sleep .5 && 
		{ echo -e "${GREEN}UPGRADE COMPLETE.${ENDCOLOR}\n" && sleep 1
		} || echo -e "${RED}FAILED TO BUILD.${ENDCOLOR}\n"
	echo -e "${BLUE}*** RELOADING SNOWFLAKE ***${ENDCOLOR}\n" && sleep 1
	systemctl restart snowflake
	echo -e "${GREEN}DONE.${ENDCOLOR}\n" && sleep .5
	exit

fi

# MOVE FILES MAKE EXEC
mvFiles

# CREATE SNOWFLAKE USER FOR SERVICE
echo -e "${GREEN}ADDING 'snowflake' USER TO RUN SNOWFLAKE SERVICE...${ENDCOLOR}\n" && sleep .5
useradd -m --shell /sbin/nologin snowflake || echo -e "${RED}FAILED TO ADD USER SNOWFLAKE${ENDCOLOR}\n" 

# BUILD TOR SNOWFLAKE SOURCE
buildsnow || echo -e "${RED}FAILED TO BUILD SNOWFLAKE PROXY SOURCE. DO YOU HAVE GOLANG 1.21+?${ENDCOLOR}\n"  

makeservice && echo -e "${GREEN}INSTALL COMPLETED.${ENDCOLOR}\n" || echo -e "${RED}SNOWFLAKE SERVICE INSTALL FAILED${ENDCOLOR}\n"

sleep .5 && echo -e "${GREEN}DONE. CHECK SNOWFLAKE STATUS WITH:${ENDCOLOR} ${BLUE}systemctl status snowflake.${ENDCOLOR}\n"
sleep .5

