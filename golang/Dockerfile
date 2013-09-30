# sneak/golang
FROM sneak/base
MAINTAINER Jeffrey Paul <sneak@datavibe.net>
RUN cd /usr/lib && wget -O - http://go.googlecode.com/files/go1.2rc1.src.tar.gz | tar zxvf -
RUN cd /usr/lib/go/src && /bin/bash all.bash
RUN echo 'export PATH="$PATH:/usr/lib/go/bin"' > \
	/etc/profile.d/go.sh
RUN echo 'export GOHOME="/usr/lib/go"' >> \
	/etc/profile.d/go.sh
RUN chmod +x /etc/profile.d/go.sh
env GOHOME /usr/lib/go
