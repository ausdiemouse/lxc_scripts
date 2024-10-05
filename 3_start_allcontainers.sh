#!/bin/bash
#This script 	1) checks for all containers  
#		2) Loads the containers into a variable 
#		3) iterates over the container values in the variable while starting each container
#		4) prints output to terminal for user verification
#		5) stops containers that are not needed
#		6) prints value to terminal for user to validate

lxc-ls --fancy

RUNNING_CONTAINERS="$(lxc-ls)"

for container in $RUNNING_CONTAINERS; do
  echo "Starting $container..."
  sudo lxc-start --name $container
done

lxc-ls --fancy

lxc-stop -n lamp_copy
lxc-stop -n lighttpd_copy

lxc-ls --fancy --running
