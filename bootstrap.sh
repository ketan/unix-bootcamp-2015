#!/bin/bash

sudo yum install --assumeyes --quiet epel-release
time sudo yum install --assumeyes --quiet curl wget tree man man-pages crontabs at mailx httpd zsh vim-enhanced htop strace git postgresql-server zlib-devel openssl-devel readline-devel sqlite-devel perl wget gcc make gcc-c++ kernel-devel-$(uname -r)
[ -e '/var/lib/pgsql/data/PG_VERSION' ] || service postgresql initdb
[ -e '/tmp/fifo' ] || su - vagrant -c 'mkfifo /tmp/fifo'

for svc in atd crond sshd httpd postgresql; do
  /etc/init.d/${svc} status > /dev/null 2>&1 || /etc/init.d/${svc} start > /dev/null 2>&1
done

# build man page index
/usr/sbin/makewhatis
