#!/bin/bash

#This file was created using the commandline history in the lamp container
#scp from the container to the host as activating root on the container is not best practise
#create another container and test this out after cleanup
#check container repository any 32 bit containers


#start in home dir
cd ~

#run the customary update upgrade
    4  apt update
    5  apt upgrade

#intsall ping
    6  apt install ping
    7  apt install iputils-ping
#Install Apache2, Check status
   16  apt update
   17  apt install -y apache2 apache2-utils
   18  apache2 -v
   19  systemctl status apache2

#Install maria-db/mysql
   21  apt install -y mariadb-server mariadb-client
   22  systemctl status mariadb
#Secure the install
   26  mysql_secure_installation
#   27  mysql -u root -p

#install php
   28  apt install php libapache2-mod-php php-cli php-fpm php-json php-pdo php-mysql php-zip php-gd  php-mbstring php-curl php-xml php-pear php-bcmath
   29  a2enmod php8.2
   30  php -v
   31  echo "<?php phpinfo(); ?>" > /var/www/html/info.php

   36   curl localhost

#   41  uname -a
#   45  lsb_release -a

#   46  lsblk
#   48  ping 8.8.8.8
#   49  ip a

#   62  history  > CmdHist24Jul24
