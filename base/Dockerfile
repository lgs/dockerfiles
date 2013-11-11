# sneak/base
FROM ubuntu:quantal
MAINTAINER Jeffrey Paul <sneak@datavibe.net>

# no interaction for build
ENV DEBIAN_FRONTEND noninteractive

# set up package sources
ADD ubuntu.list /etc/apt/sources.list
RUN apt-get update

# set up ssh and CA keys:
ADD authorized_keys /root/.ssh/authorized_keys
ADD datavibe-ca.crt /etc/ssl/certs/datavibe-ca.crt

# don't start services on install:
RUN dpkg-divert --local --rename --add /sbin/initctl ;\
    ln -s /bin/true /sbin/initctl

# fake a fuse install for java
#RUN apt-get install libfuse2 ;\
#    cd /tmp ; apt-get download fuse ;\
#    dpkg-deb -x fuse_* . ;\
#    dpkg-deb -e fuse_* ;\
#    rm fuse_*.deb ;\
#    echo -en '#!/bin/bash\nexit 0\n' > DEBIAN/postinst ;\
#    dpkg-deb -b . /fuse.deb ;\
#    dpkg -i /fuse.deb ;\
#    rm /fuse.deb ;\
#    rm -rf /tmp/*

RUN apt-get install -y --force-yes \
    git mercurial make wget vim screen \
    software-properties-common python-software-properties \
    byobu tmux lsof strace \ 
    openssh-server ssh daemontools \
    openjdk-7-jre-headless \
    gcc libc6-dev ruby-dev pv \
    rubygems pbzip2 python-pip \
    librelp0 rsyslog-relp rsyslog \
    psmisc man-db

RUN pip install boto ;\
    pip install virtualenv

# install go compiler and runtime
RUN cd /usr/lib && \
    wget -O - http://go.googlecode.com/files/go1.2rc3.src.tar.gz | tar zxvf - ;\
    cd /usr/lib/go/src && /bin/bash all.bash ;\
    echo 'export PATH="$PATH:/usr/lib/go/bin"' > \
        /etc/profile.d/go.sh ;\
    echo 'export GOHOME="/usr/lib/go"' >> \
        /etc/profile.d/go.sh  ;\
    chmod +x /etc/profile.d/go.sh

RUN c_rehash && mkdir /etc/service

RUN mkdir -p /etc/service/sshd ;\
    echo -e "#!/bin/bash\nexec /usr/sbin/sshd -D" > \
        /etc/service/sshd/run ;\
    chmod +x /etc/service/sshd/run

CMD ["/usr/bin/svscanboot"]
