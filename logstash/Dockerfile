# sneak/logstash
FROM sneak/base
MAINTAINER Jeffrey Paul <sneak@datavibe.net>
ADD https://download.elasticsearch.org/logstash/logstash/logstash-1.2.2-flatjar.jar /opt/logstash/
ADD patterns /etc/logstash/patterns
ADD logstash.conf /etc/logstash/logstash.conf
RUN apt-get update ; \
    apt-get -y upgrade ;\
    apt-get install -y --force-yes rsyslog rsyslog-relp ;\
    apt-get install -y --force-yes openjdk-7-jre-headless
