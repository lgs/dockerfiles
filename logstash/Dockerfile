# sneak/golang
FROM ubuntu
MAINTAINER Jeffrey Paul <sneak@datavibe.net>
ADD https://download.elasticsearch.org/logstash/logstash/logstash-1.2.2-flatjar.jar /opt/logstash/
ADD patterns /etc/logstash/patterns
ADD logstash.conf /etc/logstash/logstash.conf
ADD run.sh /tmp/run.sh
RUN /bin/bash -l /tmp/run.sh && rm /tmp/run.sh
