#!/bin/bash 
#installs for 32bit done directly from the debian repo

apt update && apt upgrade -y
apt install nginx -y
nginx -v

apt install curl
curl -I 127.0.0.1

#   17  history > CmdHist24Jul24
