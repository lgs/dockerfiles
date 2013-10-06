cd /usr/lib && wget -O - http://go.googlecode.com/files/go1.2rc1.src.tar.gz | tar zxvf -
cd /usr/lib/go/src && /bin/bash all.bash
echo 'export PATH="$PATH:/usr/lib/go/bin"' > \
    /etc/profile.d/go.sh
echo 'export GOHOME="/usr/lib/go"' >> \
    /etc/profile.d/go.sh
chmod +x /etc/profile.d/go.sh
