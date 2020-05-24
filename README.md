# Docker-ns-letsencrypt

A Docker image to run the [Plex-Auto-Collections script](https://github.com/vladimir-tutin/Plex-Auto-Collections).

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
Once the container is running, get the container ID
```bash
$ docker ps
```

Then, open a shell into it:
```bash
$ docker exec -it <contaner ID> bash
```

The container will create a cron job that will run once per day (3am).
