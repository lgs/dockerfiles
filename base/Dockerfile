# sneak/base
FROM ubuntu:quantal
MAINTAINER Jeffrey Paul <sneak@datavibe.net>

# no interaction for build
ENV DEBIAN_FRONTEND noninteractive

ADD ubuntu.list /etc/apt/sources.list
RUN apt-get update

# fake a fuse install for java
RUN apt-get install libfuse2
RUN cd /tmp ; apt-get download fuse
RUN cd /tmp ; dpkg-deb -x fuse_* .
RUN cd /tmp ; dpkg-deb -e fuse_*
RUN cd /tmp ; rm fuse_*.deb
RUN cd /tmp ; echo -en '#!/bin/bash\nexit 0\n' > DEBIAN/postinst
RUN cd /tmp ; dpkg-deb -b . /fuse.deb
RUN cd /tmp ; dpkg -i /fuse.deb

# set up ssh keys
ADD authorized_keys /root/.ssh/authorized_keys
ADD datavibe-ca.crt /etc/ssl/certs/datavibe-ca.crt
ADD datavibe-ca.crt /etc/ssl/certs/f232eb05.0

RUN apt-get install -y --force-yes \
    git mercurial make wget vim screen \
    gcc openssh-server daemontools \
    openjdk-7-jre-headless

# install go compiler and runtime
RUN cd /usr/lib && \
    wget -O - http://go.googlecode.com/files/go1.2rc1.src.tar.gz | tar zxvf -
RUN cd /usr/lib/go/src && /bin/bash all.bash
RUN echo 'export PATH="$PATH:/usr/lib/go/bin"' > \
    /etc/profile.d/go.sh
RUN echo 'export GOHOME="/usr/lib/go"' >> \
    /etc/profile.d/go.sh
RUN chmod +x /etc/profile.d/go.sh
