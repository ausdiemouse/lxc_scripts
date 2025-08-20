#!/bin/bash

lxc-ls --fancy
echo " "

# Get running containers
RUNNING_CONTAINERS="$(lxc-ls --running)"

for container in $RUNNING_CONTAINERS; do
  echo "Fixing repository sources for $container..."
  
  # Run the fix_repos.sh script in the container
  lxc-attach --name $container -- < fix_repos_script.sh
  
  echo "Fixed repository sources for $container."
  echo "-------------------------------------------"
  sleep 2
done

echo " "
echo "Repository fix completed for all containers."
echo " "
lxc-ls --fancy
