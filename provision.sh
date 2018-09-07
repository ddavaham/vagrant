#!/bin/bash

PASS="Adv@nce1!"

echo "root:q" | sudo chpasswd
sudo apt install debconf-utils -y
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password password $PASS"
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password_again password $PASS"
sudo add-apt-repository ppa:ondrej/php

sudo apt update && sudo apt upgrade -y

sudo apt install -y apache2 mysql-server php7.1 php7.1-cli php7.1-common php7.1-json php7.1-opcache php7.1-mysql php7.1-mbstring php7.1-mcrypt php7.1-zip php7.1-fpm php7.1-curl php7.1-dom php7.1-tidy supervisor zip unzip pwgen
a2enmod proxy_fcgi setenvif rewrite ssl
a2enconf php7.1-fpm

echo "ServerName localhost" >>  /etc/apache2/apache2.conf
sudo systemctl restart apache2

sudo chmod +x /vagrant/install-composer.sh
sudo ./install-composer.sh

sudo chmod +x /vagrant/create-mysql.sh

sudo cp /vagrant/sshd_config /etc/ssh/
sudo systemctl restart ssh
