# sneak/base
FROM ubuntu:quantal
MAINTAINER Jeffrey Paul <sneak@datavibe.net>

ADD . /var/lib/dockerbuild

# no interaction for build
ENV DEBIAN_FRONTEND noninteractive

# set up package sources
ADD ubuntu.list /etc/apt/sources.list
RUN apt-get update

# set up ssh and CA keys:
ADD authorized_keys /root/.ssh/authorized_keys
ADD datavibe-ca.crt /etc/ssl/certs/datavibe-ca.crt

RUN chown root:root /root/.ssh /root/.ssh/* ; \
    chmod go-rwx /root/.ssh /root/.ssh/*

# don't start services on install:
RUN dpkg-divert --local --rename --add /sbin/initctl ;\
    ln -s /bin/true /sbin/initctl

# have to update after fixing initctl
RUN apt-get update ; apt-get upgrade -y

# set up /dev/xconsole for rsyslog to work right
RUN ln -s /dev/tty /dev/xconsole

# install packages
RUN apt-get install -y --force-yes \
    git mercurial make wget vim screen \
    software-properties-common \
    python-software-properties \
    byobu tmux lsof strace \ 
    openssh-server ssh daemontools \
    gcc libc6-dev ruby-dev pv \
    rubygems pbzip2 python-pip \
    rsyslog-relp rsyslog \
    rsync \
    psmisc man-db traceroute telnet

# basic python install, everything else in virtualenvs
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

# now that openssl is installed we can hash the CA cert
RUN c_rehash

# sshd requires its runtime dir to start
RUN mkdir /var/run/sshd
ADD sshd.run /etc/service/sshd/run
RUN chmod u+rx /etc/service/sshd/run

# setup rsyslog
ADD 60-agg.conf /etc/rsyslog.d/
RUN rm /etc/rsyslog.d/50-default.conf ; \
    chown syslog:adm /var/spool/rsyslog
ADD rsyslogd.run /etc/service/rsyslogd/run
RUN chmod u+rx /etc/service/rsyslogd/run

# ssh port
EXPOSE 22

CMD ["/usr/bin/svscanboot"]
