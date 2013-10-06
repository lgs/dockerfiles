#!/bin/bash
apt-get install rsyslog rsyslog-relp 
mkdir -p /opt/logstash
cd /opt/logstash
wget https://download.elasticsearch.org/logstash/logstash/logstash-1.2.1-flatjar.jar
