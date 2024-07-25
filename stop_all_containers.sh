#!/bin/bash

lxc-ls --fancy

#RUNNING_CONTAINERS="$(lxc-ls)"
RUNNING_CONTAINERS="$(lxc-ls --running)"

#stop services on containers
lxc-attach -n gitea -- systemctl stop gitea
lxc-attach -n gitea -- systemctl status gitea -l --no-pager		#--no-pager option added to automate and -l from more info
#lxc-attach -n nodejs -- systemctl status nodejs	#app.js has not been setup to run auto. node is not autostarted. could set it up as a service. and revisit this line.


sleep 5

echo "check graceful shutdown of services for other containers"



for container in $RUNNING_CONTAINERS; do
  echo "Stopping $container..."
  lxc-stop --name $container
done

lxc-ls --fancy



