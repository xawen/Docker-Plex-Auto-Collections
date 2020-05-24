#!/bin/bash

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
