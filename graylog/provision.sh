#!/bin/sh

apt-get update 2>&1 > /dev/null
apt-get -y install git-core screen curl 2>&1 > /dev/null

mkdir -p /tmp/modules
cd /tmp/modules
git clone https://github.com/ehazlett/puppet-module-graylog2 graylog2

puppet apply --modulepath=/tmp/modules -e "include graylog2"
rm -rf /tmp/modules

