FROM alpine
MAINTAINER JDM

# Install Alpine packages
RUN apk add --no-cache curl git bash python3 py3-pip nano libxml2 libxml2-dev libxslt libxslt-dev musl-dev py-lxml gcc

#Clone repo and setup
RUN mkdir /opt/plex-auto-collections
RUN git clone https://github.com/vladimir-tutin/Plex-Auto-Collections.git /opt/plex-auto-collections
RUN pip3 install -r /opt/plex-auto-collections/requirements.txt

# Setup crontab
ENV CRONTAB_FILE=/etc/periodic/daily/plex-auto-collections

# Setup cron jobs
RUN echo "#!/bin/sh" > ${CRONTAB_FILE} && \
     echo "cd /opt/plex-auto-collections" >> ${CRONTAB_FILE} && \
	 echo "python3 plex_auto_collections.py --update --noserver > /proc/1/fd/1 2>/proc/1/fd/2" >> ${CRONTAB_FILE} && \
     chmod 0744 ${CRONTAB_FILE}

COPY ./entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]

CMD ["crond", "-f", "-d", "8" ]
