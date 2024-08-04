#!/bin/bash

#This file was created using the commandline history in the lamp container
#scp from the container to the host as activating root on the container is not best practise
#create another container and test this out after cleanup
#check container repository any 32 bit containers


#start in home dir
cd ~

#run the customary update upgrade
apt update
apt upgrade

#install ping
apt install ping
apt install iputils-ping
#Install Apache2, Check status
apt update
apt install -y apache2 apache2-utils
apache2 -v
systemctl status apache2

#Install maria-db/mysql
apt install -y mariadb-server mariadb-client
systemctl status mariadb

#Secure the install
mysql_secure_installation

#   27  mysql -u root -p

#install php
apt install php libapache2-mod-php php-cli php-fpm php-json php-pdo php-mysql php-zip php-gd  php-mbstring php-curl php-xml php-pear php-bcmath
a2enmod php8.2
php -v
echo "<?php phpinfo(); ?>" > /var/www/html/info.php

curl localhost

#   41  uname -a
#   45  lsb_release -a

#   46  lsblk
#   48  ping 8.8.8.8
#   49  ip a

#   62  history  > CmdHist24Jul24
