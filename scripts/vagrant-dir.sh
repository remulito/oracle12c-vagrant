#!/bin/sh

echo 'Move ~/vagrant/install/ to /vagrant: '
yum install -y unzip
mv -v /home/vagrant/install/ /vagrant
echo 'Unzip oracle installation files: '
cd /vagrant
unzip  linuxamd64_12102_database_1of2.zip
unzip  linuxamd64_12102_database_2of2.zip

echo "Installation files are moved to /vagrant"