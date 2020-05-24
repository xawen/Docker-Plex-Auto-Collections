# Docker-Plex-Auto-Collections

A Docker image to run the [Plex-Auto-Collections script](https://github.com/vladimir-tutin/Plex-Auto-Collections).  This is intended to run the script on a schedule to create Collections from dynamic lists like an [IMDB Most Popular Search] (https://www.imdb.com/search/title/?title_type=feature&moviemeter=1,300).  Since the image server isn't needed for that, the script is set to run with the --noserver option.

## Discussion
TBD

## Starting a container
```
docker run --name Plex-Auto-Collections \
        --mount type=bind,source=<path to data>,target=/config \
        --mount type=bind,source=/etc/localtime,destination=/etc/localtime,readonly \
        xawen/plex-auto-collections

```

## Configuration
Edit the config.yml file in your data directory.  Instructions for the file are on the script web site above.  

The container will create a cron job that will run once per day (3am).  To run the script manually:
Once the container is running, get the container ID
```bash
$ docker ps
```

Then, open a shell into it:
```bash
$ docker exec -it <contaner ID> bash
```

Then execute the script manually:
```bash
$ cd /opt/plex-auto-collections
$ python3 ./plex-auto-collections.py --update --noserver
```
