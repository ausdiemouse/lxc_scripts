#!/bin/bash

lxc-ls --fancy
echo " "

RUNNING_CONTAINERS="$(lxc-ls)"


for container in $RUNNING_CONTAINERS; do
  echo "Updating $container..."

  lxc-attach --name $container -- apt update
  lxc-attach --name $container -- apt -y upgrade

  echo "Updated $container."
  echo "-------------------"
  sleep 2
done

echo " "
lxc-ls --fancy

