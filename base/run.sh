#!/bin/bash
cat > /etc/ssl/certs/datavibe-ca.crt <<EOF
-----BEGIN CERTIFICATE-----
MIIEhTCCA22gAwIBAgIJALeiI/xma9WqMA0GCSqGSIb3DQEBBQUAMIGHMRgwFgYD
VQQDEw9kYXRhdmliZS5uZXQgQ0ExCzAJBgNVBAYTAlVTMREwDwYDVQQIEwhOZXcg
WW9yazERMA8GA1UEBxMITmV3IFlvcmsxFTATBgNVBAoTDGRhdGF2aWJlLm5ldDEh
MB8GCSqGSIb3DQEJARYSYWRtaW5AZGF0YXZpYmUubmV0MCAXDTA5MDgzMDExNTEz
NVoYDzIxMDkwODA2MTE1MTM1WjCBhzEYMBYGA1UEAxMPZGF0YXZpYmUubmV0IENB
MQswCQYDVQQGEwJVUzERMA8GA1UECBMITmV3IFlvcmsxETAPBgNVBAcTCE5ldyBZ
b3JrMRUwEwYDVQQKEwxkYXRhdmliZS5uZXQxITAfBgkqhkiG9w0BCQEWEmFkbWlu
QGRhdGF2aWJlLm5ldDCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBALNe
eGSDC3UG/IGCLFi+jocREJm3xYF0YlIIvU/fFOMjw1q9Rfk14bRl8HoIbsXwwzcS
1euDCLxVjuZHbvOdjimjg3JfktckJCkD9cV4/vdAEKRlRN6maL9cZOkMATKyQZyZ
YTfeg8p1lPaSaBrd+FuG8TQ/tnwRWtSHrZKzgUt+fEibOeXOWY8CxpA29uJ7Vj85
WJf/ErEsZZDkOUlqeTotNb7tP5FIn6hWf4iTIVlXiq4uh8pzCeKgrD2Z64oWTXwE
jVFxXXUD0pIWOlVQfRfNZU2RB4E2W/5Fcwx5I+rWkfJvoj+p+i8LtWunw5CWAYrl
G8GgYNe1MNn8HEp/ERMCAwEAAaOB7zCB7DAdBgNVHQ4EFgQUE7m8sb+YPTknXN+O
8J/2GEFzhhMwgbwGA1UdIwSBtDCBsYAUE7m8sb+YPTknXN+O8J/2GEFzhhOhgY2k
gYowgYcxGDAWBgNVBAMTD2RhdGF2aWJlLm5ldCBDQTELMAkGA1UEBhMCVVMxETAP
BgNVBAgTCE5ldyBZb3JrMREwDwYDVQQHEwhOZXcgWW9yazEVMBMGA1UEChMMZGF0
YXZpYmUubmV0MSEwHwYJKoZIhvcNAQkBFhJhZG1pbkBkYXRhdmliZS5uZXSCCQC3
oiP8ZmvVqjAMBgNVHRMEBTADAQH/MA0GCSqGSIb3DQEBBQUAA4IBAQATPTSXK4WK
UfYFeLy/r3L8hlNJPDDkPl3V1LqCttby1muB1CbMqKBz5ul6RiEp/t52YTtwGc4o
rb/EoxqI74K3KaFQdGZwGmpXwoL+f/PpQLiksHBKCg6UBcm81cb4IpSfSf7X1C9J
XEqoB2dcToFpoPqTetOfkqDAa/ggkJ7rqXKC6HTLN3HdKO4lRw0Eb/c0F84zLela
AfA1qULFzXNtV6Lim/ddGBg6FLdLA+GHGrxb7JwffSa98TWV8GQghSeURHfOeNxm
SoUV3xjKVmnQoxucOR18tD7Qj+KW2lESDl0tUTuIpQ4lSsFt4pFwnll59H0DpVU8
F75p++/zvN75
-----END CERTIFICATE-----
EOF
ln -s /etc/ssl/certs/datavibe-ca.crt /etc/ssl/certs/f232eb05.0
mkdir -p ${HOME}/.ssh
F="${HOME}/.ssh/authorized_keys"
echo -n "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA2BRNjtz7nqobJQqDtiX" > $F
echo -n "hcX6sgNTiPLAFEGHDL0QbCFFWt1HTWsvE6t3Z6UkhKszAaVfwFDIChL" >> $F
echo -n "3KGrpGpoS24sFPqMe+d5FGGbgeSv0527G8tE4HZqQRrWS5rwZz+VgGB" >> $F
echo -n "skWD32imZwKZpOICM74LrrR9v7DZrRDXFSTql4oWJvPwm2pvkMrCbi9" >> $F
echo -n "o61VexJ3hXIuI8mFbwZ0EoF5mQ60MMt8Yw/d4AqFr/eC3wUsWPDLQ2T" >> $F
echo -n "iz2Y2WoPfklD6uBNBXxUdjO/oIF9WBuRxucFh5LIWnkm08bJY7+QlVU" >> $F
echo -n "EdOL5GqJQademufnz+zzYyIr9l9YjGkD1DQWtskv6vJbl7HQ== " >> $F
echo "sneak@ganymede" >> $F
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
