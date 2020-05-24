FROM alpine
MAINTAINER JDM

# Install Alpine packages
RUN apk add --no-cache curl git bash python3 py3-pip nano


# Setup crontab
ENV CRONTAB_FILE=/etc/periodic/daily/plex-auto-collections

# Setup cron jobs
RUN echo "#!/bin/sh" > ${CRONTAB_FILE} && \
     echo "cd /opt/plex-auto-collections" >> ${CRONTAB_FILE} && \
	 echo "python plex_auto_collections.py --update --noserver > /proc/1/fd/1 2>/proc/1/fd/2" >> ${CRONTAB_FILE} && \
     chmod 0744 ${CRONTAB_FILE}

COPY ./entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]

CMD ["crond", "-f", "-d", "8" ]
