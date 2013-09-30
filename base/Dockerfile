# sneak/base
FROM ubuntu:precise
MAINTAINER Jeffrey Paul <sneak@datavibe.net>
RUN echo "deb http://archive.ubuntu.com/ubuntu precise universe" >> \
	/etc/apt/sources.list.d/all.list
RUN echo "deb http://archive.ubuntu.com/ubuntu precise-updates universe" >> \
	/etc/apt/sources.list.d/all.list
RUN echo "deb http://archive.ubuntu.com/ubuntu precise multiverse" >> \
	/etc/apt/sources.list.d/all.list
RUN echo "deb http://archive.ubuntu.com/ubuntu precise-updates multiverse" >> \
	/etc/apt/sources.list.d/all.list
RUN apt-get update
RUN apt-get -y install git mercurial make wget vim screen gcc
