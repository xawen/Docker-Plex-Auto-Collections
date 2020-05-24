#!/bin/bash

#Grab the script files and setup the environment
# if [ ! -f "/opt/plex-auto-collections/plex_auto_collections.py" ]; then
#	mkdir /opt/plex-auto-collections
#	git clone https://github.com/vladimir-tutin/Plex-Auto-Collections.git /opt/plex-auto-collections
#	pip3 install -r /opt/plex-auto-collections/requirements.txt
#fi

#Copy fresh config file to config imported path if it does't exist
if [ ! -f "/config/config.yml" ]; then
	cp /opt/plex-auto-collections/config.yml.template /config/config.yml
	ln -s /config/config.yml /opt/plex-auto-collections/config.yml
fi

#Link config file to imported location
if [ ! -f "/opt/plex-auto-collections/config.yml" ]; then
	ln -s /config/config.yml /opt/plex-auto-collections/config.yml
fi

exec "$@"
