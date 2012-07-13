#!/bin/sh

apt-get update 2>&1 > /dev/null
apt-get -y install openjdk-6-jre ruby rubygems python-dev python-setuptools screen curl

easy_install pip
pip install bernhard

gem install riemann-client riemann-tools riemann-dash

if [ ! -e riemann.tar.bz2 ]; then
    wget -q http://aphyr.com/riemann/riemann-0.1.1.tar.bz2 -O riemann.tar.bz2
    tar jxf riemann.tar.bz2
fi

cd riemann-*
sudo -u vagrant screen -S riemann -d -m ./bin/riemann etc/riemann.config
sudo -u vagrant screen -S dash -d -m riemann-dash
sudo -u vagrant screen -S health -d -m riemann-health
