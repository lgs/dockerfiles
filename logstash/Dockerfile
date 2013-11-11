FROM eeqj/base:20131111
MAINTAINER Jeffrey Paul <sneak@datavibe.net>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get upgrade && \
    apt-get install -y openjdk-7-jre-headless
ADD https://download.elasticsearch.org/logstash/logstash/logstash-1.2.2-flatjar.jar /opt/logstash/
ADD patterns /etc/logstash/patterns
ADD logstash.conf /etc/logstash/logstash.conf

EXPOSE 5142

ENV LSJAR /opt/logstash/logstash-1.2.2-flatjar.jar
ENV LSCONF /etc/logstash/logstash.conf

ADD logstash.run /etc/service/logstash/run

RUN chmod +x /etc/service/logstash/run

CMD ["/usr/bin/svscanboot"]
