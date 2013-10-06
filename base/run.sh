#!/bin/bash
echo "deb http://archive.ubuntu.com/ubuntu precise universe" >> \
    /etc/apt/sources.list.d/all.list
echo "deb http://archive.ubuntu.com/ubuntu precise-updates universe" >> \
    /etc/apt/sources.list.d/all.list
echo "deb http://archive.ubuntu.com/ubuntu precise multiverse" >> \
    /etc/apt/sources.list.d/all.list
echo "deb http://archive.ubuntu.com/ubuntu precise-updates multiverse" >> \
    /etc/apt/sources.list.d/all.list
apt-get update
apt-get -y install git mercurial make wget vim screen gcc
