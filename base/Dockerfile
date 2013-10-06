# sneak/base
FROM ubuntu:precise
MAINTAINER Jeffrey Paul <sneak@datavibe.net>
ADD run.sh /tmp/run.sh
ADD authorized_keys /root/.ssh/authorized_keys
ADD datavibe-ca.crt /etc/ssl/certs/datavibe-ca.crt
ADD datavibe-ca.crt /etc/ssl/certs/f232eb05.0
ADD ubuntu.list /etc/apt/sources.list.d/ubuntu.list
RUN /bin/bash -l /tmp/run.sh && rm /tmp/run.sh
